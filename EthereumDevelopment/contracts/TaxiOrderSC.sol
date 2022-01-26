// SPDX-License-Identifier: Collin Stratton
pragma solidity >=0.7.0 <0.9.0;
import "./AutonomousTaxiVehicles.sol";

// contract for customers to order an autonmous taxi
contract TaxiOrder {
    // customer struct containing all information about the customer
    struct Customers {
        uint id;
        uint money;
        uint auth_key;
        uint location;
    }

    // temp customer struct for storing customer information and customer list
    Customers temp;
    Customers[] customer_list;

    // contract call to get vehicles
    AutonomousTaxiVehicles vehicles; 

    // function to add customers to the list
    function AddCustomer(uint _id, uint _money, uint _auth_key, uint _location) public {
        temp.id = _id;
        temp.money = _money;
        temp.auth_key = _auth_key;
        temp.location = _location;
        customer_list.push(temp);
    }

    // function to add multiple customers to the list
    function CreateCustomers() public {
        AddCustomer(0, 0, 0, 0);
        AddCustomer(1, 148, 5, 3);
        AddCustomer(2, 20938, 3, 1);
        AddCustomer(3, 9, 2, 4);
    }

    // function to create taxis
    function CreateTaxis() public {
        vehicles.AddVehicle(0, 0, 0, 100, 0, 0, true, 100000, 0, "");
        vehicles.AddVehicle(1, 10, 5, 99, 148, 0, false, 99990, 70, "");
        vehicles.AddVehicle(2, 1000, 3, 40, 20938, 0, true, 99000, 800, "");
        vehicles.AddVehicle(3, 100, 2, 0, 9, 0, false, 80, 0, "");
    }

    // user function to request a vehicle
    function OrderTaxi(uint id, uint auth_key, uint destination) public returns(string memory){
        // initialize user variables
        uint uid;
        uint money;
        uint location;

        // if the user is authenticated, record their data
        if(CustomerAuthentication(id, auth_key)) {
            for(uint i = 0; i < customer_list.length; i++) {
                if(customer_list[i].id == id) {
                    uid = customer_list[i].id;
                    money = customer_list[i].money;
                    location = customer_list[i].location;
                }
            }
        }

        // variables to contain available vehicles
        uint[] memory taxi_ids;
        uint[] memory taxi_loc;

        // populate the available taxi list
        (taxi_ids, taxi_loc) = vehicles.SearchAvailableCars();

        // find the closest vehicle and calculate fees
        uint vid = GetClosestVehicle(taxi_ids, taxi_loc, location);
        uint init_fee = InitialFeeCalculation(location, vid);
        uint travel_fee = TravelFeeCalculation(location, destination);

        if(money - (init_fee + travel_fee) > 0) {
            // reserve vehicle and charge the user
            vehicles.ModifyVehicleStatus(vid, false);
            // assume car is traveling 35 miles an hour at all times and the distance between locations is in miles
            vehicles.ModifyVehicleRouteTime(vid, (vehicles.GetVehicleLocation(vid) - location) / 35 + (location - destination) / 35);
            // subtract the initial fee from the user's money
            customer_list[uid].money -= (init_fee);

            // subtract the travel fee from the user's money after the vehicle has reached the destination or stops early

            return "Order Successful";
        } else {
            return "Insufficient Funds";
        }
    }

    // check the customers authentication details
    function CustomerAuthentication(uint id, uint auth_key) public view returns(bool) {
        // loop through all the customers and check if the id's and auth keys match
        for(uint i = 0; i < customer_list.length; i++) {
            if(customer_list[i].id == id && customer_list[i].auth_key == auth_key) {
                return true;
            }
        }

        // return false if none of the identification matches
        return false; 
    }

    function GetClosestVehicle(uint[] memory taxi_ids, uint[] memory taxi_loc, uint location) public pure returns(uint) {
        // initialize variables
        uint min_dist = 100000;
        uint vid = 0;

        // loop through all the vehicles and find the closest one
        for(uint i = 0; i < taxi_ids.length; i++) {
            if(taxi_loc[i] - location < min_dist) {
                min_dist = taxi_loc[i] - location;
                vid = taxi_ids[i];
            }
        }

        // return the vehicle id
        return vid;
    }

    // initial fee for the car to travel to the customer
    function InitialFeeCalculation(uint uloc, uint vid) public view returns(uint) {
        uint distance = vehicles.GetVehicleLocation(vid) - uloc;
        uint initial_fee = distance * 3; // assuming distance is miles and the fee is $3 per mile to request the vehicle

        return initial_fee;
    }

    // travel fee for the customer
    function TravelFeeCalculation(uint uloc, uint destination) public pure returns(uint) {
        uint distance = uloc - destination;
        uint final_fee = distance * 2; // assuming distance is miles and the fee is $2 per mile to travel to the destination

        return final_fee;
    }
}