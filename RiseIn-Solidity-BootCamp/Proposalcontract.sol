// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ProposalContract {
    uint256 private counter; // This line is added

    struct Proposal {
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes of fails
        bool is_active; // This shows if others can vote to our contract
    }

    // In this mapping you have uint256 as the key and the proposal as the value. So, you will be able to get the proposal based on its key uint256 value, which will be the id of the proposal.
    mapping(uint256 => Proposal) proposal_history; // Recordings of previous proposals

    // Calldata:  calldata keyword in Solidity function parameters to pass large, complex data types like arrays, structs and sometimes 
    // strings more efficiently by storing them in immutable call data rather than temporary memory.
    function create(string calldata _description, uint256 _total_vote_to_end) external {
        counter += 1;
        proposal_history[counter] = Proposal(_description, 0, 0, 0, _total_vote_to_end, false, true);
    }

}