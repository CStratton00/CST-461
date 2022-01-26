// SPDX-License-Identifier: Collin Stratton
pragma solidity >=0.7.0 <0.9.0;

// contract for a self sustainable autonomous taxi network
contract SmartVehicle {
    // vehicle struct containing all relevant vehicle information for individual vehicles
    struct Vehicle {
        uint id;
        uint miles;
        uint location;
        uint gas_level;
        uint time_driven;
        uint status;
        uint miles_to_service;
        uint revenue;
        string report;
    }

    // customer struct containing all the variables necessary for a customer
    struct Customer {
        uint id;
        uint money;
        uint auth_key;
        uint location;
    }

    // create some cars and add them to a list
    Vehicle car1;
    Vehicle car2;
    Vehicle car3;

    Vehicle[] public carList = [car1, car2, car3];

    // create some customers and add them to a list
    Customer customer1;
    Customer customer2;
    Customer customer3;

    Customer[] public customerList = [customer1, customer2, customer3];


    // add values to the initally created cars
    function setCars() public {
        car1.id = 1;
        car1.miles = 0;
        car1.location = 0;
        car1.gas_level = 100;
        car1.time_driven = 0;
        car1.status = 0;
        car1.miles_to_service = 10000;
        car1.revenue = 0;
        car1.report = "";

        car2.id = 2;
        car2.miles = 0;
        car2.location = 0;
        car2.gas_level = 100;
        car2.time_driven = 0;
        car2.status = 0;
        car2.miles_to_service = 10000;
        car2.revenue = 0;
        car2.report = "";

        car3.id = 3;
        car3.miles = 0;
        car3.location = 0;
        car3.gas_level = 100;
        car3.time_driven = 0;
        car3.status = 0;
        car3.miles_to_service = 10000;
        car3.revenue = 0;
        car3.report = "";
    }

    // function to add new cars to the list
    function addNewCar(uint id, uint miles, uint location, uint gas_level, uint time_driven, uint status, uint miles_to_service, uint revenue, string memory report) public {
        Vehicle memory newCar;
        newCar.id = id;
        newCar.miles = miles;
        newCar.location = location;
        newCar.gas_level = gas_level;
        newCar.time_driven = time_driven;
        newCar.status = status;
        newCar.miles_to_service = miles_to_service;
        newCar.revenue = revenue;
        newCar.report = report;

        carList.push(newCar);
    }

    // function to add new customers to the list
    function setCustomers() public {
        customer1.id = 1;
        customer1.money = 1000;
        customer1.auth_key = 123;
        customer1.location = 1;

        customer2.id = 2;
        customer2.money = 1000;
        customer2.auth_key = 234;
        customer2.location = 2;

        customer3.id = 3;
        customer3.money = 1000;
        customer3.auth_key = 345;
        customer3.location = 3;
    }

    // function to add new customers to the list
    function addNewCustomers(uint id, uint money, uint auth_key, uint location) public {
        Customer memory newCustomer;
        newCustomer.id = id;
        newCustomer.money = money;
        newCustomer.auth_key = auth_key;
        newCustomer.location = location;

        customerList.push(newCustomer);
    }

    // user function to request a vehicle
    function CallRide(uint id, uint auth_key, uint destination) public {
        // initialize user variables
        uint uid;
        uint money;
        uint location;

        // if the user is authenticated, record their data
        if(CustomerAuthentication(id, auth_key)) {
            for(uint i = 0; i < customerList.length; i++) {
                if(customerList[i].id == id) {
                    uid = customerList[i].id;
                    money = customerList[i].money;
                    location = customerList[i].location;
                }
            }
        }

        // find the closest vehicle and calculate fees
        uint vid = GetClosestVehicle(location);
        uint init_fee = InitialFeeCalculation(location, vid);
        uint travel_fee = TravelFeeCalculation(location, destination);

        if(money - (init_fee + travel_fee) > 0) {
            // reserve vehicle and charge the user
            carList[vid].status = (carList[vid].location - location) + (destination - carList[vid].location);
            customerList[uid].money -= (init_fee + travel_fee);
        } else {
            // notify the user that they do not have enough money
            return;
        }
    }

    // check the customers authentication details
    function CustomerAuthentication(uint id, uint auth_key) public view returns(bool) {
        // loop through all the customers and check if the id's and auth keys match
        for(uint i = 0; i < customerList.length; i++) {
            if(customerList[i].id == id && customerList[i].auth_key == auth_key) {
                return true;
            }
        }

        // return false if none of the identification matches
        return false; 
    }

    // get the closest vehicle to the user based on location
    function GetClosestVehicle(uint loc) public view returns(uint) {
        // initialize variables
        uint distance;
        uint vehicle_id;

        // loop through all the vehicles checking their status and service needs
        for(uint i = 0; i < carList.length; i++) {
            if(carList[i].status == 0 && CheckVehicle(carList[i].id)) {
                if(carList[i].location - loc < distance) {
                    vehicle_id = carList[i].id;
                }
            }
        }

        // return the closest vehicle id
        return vehicle_id;
    }

    // check the vehicle condition of the inputted id
    function CheckVehicle(uint vid) public view returns(bool) {
        // check if car needs gas
        if(carList[vid].gas_level < 10) {
            // carList[vid].report = "Gas is low, please refill";
            return false;
        } 

        // check if the car needs to be serviced
        if(carList[vid].miles_to_service < 100) {
            // carList[vid].report = "Car needs to be serviced";
            return false;
        }

        // return true if the car is ready to be used
        return true;
    }

    // initial fee for the car to travel to the customer
    // event initialFeeCalculation(uint initial_fee);
    function InitialFeeCalculation(uint uloc, uint vid) public view returns(uint) {
        uint distance = carList[vid].location - uloc;
        uint initial_fee = distance * 3; // assuming distance is miles and the fee is $3 per mile to request the vehicle

        // emit initialFeeCalculation(initial_fee);
        return initial_fee;
    }

    // travel fee for the customer
    // event travelFeeCalculation(uint travel_fee);
    function TravelFeeCalculation(uint uloc, uint destination) public pure returns(uint) {
        uint distance = uloc - destination;
        uint final_fee = distance * 2; // assuming distance is miles and the fee is $2 per mile to travel to the destination

        // emit travelFeeCalculation(final_fee);
        return final_fee;
    }

    // display the details of all the cars
    function CarStatuses() public {
        for(uint i = 0; i < carList.length; i++) {
            // print("Car ID: " + carList[i].id);
            // print("Miles: " + carList[i].miles);
            // print("Location: " + carList[i].location);
            // print("Gas Level: " + carList[i].gas_level);
            // print("Time Driven: " + carList[i].time_driven);
            // print("Status: " + carList[i].status);
            // print("Miles to Service: " + carList[i].miles_to_service);
            // print("Revenue: " + carList[i].revenue);
            // print("Report: " + carList[i].report);
            // print("");
        }
    }
}