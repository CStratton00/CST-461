// SPDX-License-Identifier: Collin Stratton
pragma solidity >=0.7.0 <0.9.0;

contract AutonomousTaxiVehicles {
    struct Vehicle {
        uint id;
        uint miles_driven;
        uint curr_loc;
        uint gas_level;
        uint time_driven;
        uint curr_route_time;
        bool status;
        uint miles_to_service;
        uint revenue;
        string report;
    }

    Vehicle temp;
    Vehicle[] public inventory;
    uint[] vehicle_ids;
    uint[] vehicle_loc;

    function AddVehicle(uint _id, uint _miles_driven, uint _curr_loc, uint _gas_level, uint _time_driven, uint _curr_route_time, bool _status, uint _miles_to_service, uint _revenue, string memory _report) public {
        temp.id = _id;
        temp.miles_driven = _miles_driven;
        temp.curr_loc = _curr_loc;
        temp.gas_level = _gas_level;
        temp.time_driven = _time_driven;
        temp.curr_route_time = _curr_route_time;
        temp.status = _status;
        temp.miles_to_service = _miles_to_service;
        temp.revenue = _revenue;
        temp.report = _report;
        inventory.push(temp);
    }

    function DisplayVehicle(uint i) public view returns (uint temp_id, uint temp_miles_driven, uint temp_curr_loc, uint temp_gas_level, uint temp_time_driven, uint temp_curr_route_time, bool temp_status, uint temp_miles_to_service, uint temp_revenue, string memory temp_report) {
        temp_id = inventory[i].id;
        temp_miles_driven = inventory[i].miles_driven;
        temp_curr_loc = inventory[i].curr_loc;
        temp_gas_level = inventory[i].gas_level;
        temp_time_driven = inventory[i].time_driven;
        temp_curr_route_time = inventory[i].curr_route_time;
        temp_status = inventory[i].status;
        temp_miles_to_service = inventory[i].miles_to_service;
        temp_revenue = inventory[i].revenue;
        temp_report = inventory[i].report;

        return(temp_id, temp_miles_driven, temp_curr_loc, temp_gas_level, temp_time_driven, temp_curr_route_time, temp_status, temp_miles_to_service, temp_revenue, temp_report);
    }

    function ModifyVehicleStatus(uint vid, bool _status) public {
        for(uint i = 0; i < vehicle_ids.length; i++) {
            if(vehicle_ids[i] == vid) {
                inventory[i].status = _status;
            }
        }
    }

    function ModifyVehicleRouteTime(uint vid, uint _curr_route_time) public {
        for(uint i = 0; i < vehicle_ids.length; i++) {
            if(vehicle_ids[i] == vid) {
                inventory[i].curr_route_time = _curr_route_time;
            }
        }
    }

    function GetVehicleLocation(uint vid) public view returns (uint temp_curr_loc) {
        for(uint i = 0; i < vehicle_ids.length; i++) {
            if(vehicle_ids[i] == vid) {
                temp_curr_loc = inventory[i].curr_loc;
            }
        }
        return(temp_curr_loc);
    }

    function DisplayAllVehciles() public returns (uint[] memory) {
        delete vehicle_ids;
        for (uint i = 0; i < inventory.length; i++) {
            vehicle_ids.push(inventory[i].id);
        }
        return vehicle_ids;
    }

    function SearchAvailableCars() public returns (uint[] memory temp_id, uint[] memory temp_loc) {
        delete vehicle_ids;
        delete vehicle_loc;
        for (uint i = 0; i < inventory.length; i++) {
            if (inventory[i].status == true) {
                vehicle_ids.push(inventory[i].id);
                vehicle_loc.push(inventory[i].curr_loc);
            }
        }
        temp_id = vehicle_ids;
        temp_loc = vehicle_loc;

        return(temp_id, temp_loc);
    }

    function CheckGasLevel(uint vid) public view returns (uint temp_gas_level) {
        for(uint i = 0; i < vehicle_ids.length; i++) {
            if(vehicle_ids[i] == vid) {
                temp_gas_level = inventory[i].gas_level;
            }
        }
        return(temp_gas_level);
    }

    function CheckServiceMiles(uint vid) public view returns (uint temp_miles_to_service) {
        for(uint i = 0; i < vehicle_ids.length; i++) {
            if(vehicle_ids[i] == vid) {
                temp_miles_to_service = inventory[i].miles_to_service;
            }
        }
        return(temp_miles_to_service);
    }
}