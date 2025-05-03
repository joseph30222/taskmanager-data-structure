// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TaskManager {
    // Enum to define task status
    enum TaskStatus { Pending, Completed }

    // Struct to represent a task
    struct Task {
        uint id;
        string description;
        TaskStatus status;
        uint createdAt;
    }

    // Mapping to store tasks by ID
    mapping(uint => Task) public tasks;

    // Array to store all task IDs
    uint[] public taskIds;

    // Counter for task IDs
    uint private taskCounter;

    // Events for task actions
    event TaskCreated(uint id, string description, TaskStatus status, uint createdAt);
    event TaskUpdated(uint id, string description, TaskStatus status);
    event TaskDeleted(uint id);

    // Function to add a new task
    function addTask(string memory _description) public {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _description, TaskStatus.Pending, block.timestamp);
        taskIds.push(taskCounter);
        emit TaskCreated(taskCounter, _description, TaskStatus.Pending, block.timestamp);
    }

    // Function to update a task's description or status
    function updateTask(uint _id, string memory _description, TaskStatus _status) public {
        require(_id > 0 && _id <= taskCounter, "Task does not exist");
        tasks[_id].description = _description;
        tasks[_id].status = _status;
        emit TaskUpdated(_id, _description, _status);
    }

    // Function to delete a task
    function deleteTask(uint _id) public {
        require(_id > 0 && _id <= taskCounter, "Task does not exist");
        delete tasks[_id];
        // Remove ID from taskIds array
        for (uint i = 0; i < taskIds.length; i++) {
            if (taskIds[i] == _id) {
                taskIds[i] = taskIds[taskIds.length - 1];
                taskIds.pop();
                break;
            }
        }
        emit TaskDeleted(_id);
    }

    // Function to get a single task
    function getTask(uint _id) public view returns (Task memory) {
        require(_id > 0 && _id <= taskCounter, "Task does not exist");
        return tasks[_id];
    }

    // Function to get all task IDs
    function getAllTaskIds() public view returns (uint[] memory) {
        return taskIds;
    }
}