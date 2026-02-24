# Ethernaut Exploit & Security Reports

Personal project solving Ethernaut levels (OpenZeppelin) using Foundry PoCs. Focus on understanding vulnerabilities, reproducing exploits locally/forked and documenting risks + recommended mitigations.

## Solved Levels

- [Fallback](test/fallback/README.md) -> Ownership takeover via permissive receive();

- [Fallout](test/fallout/README.md) -> Fake constructor ('Fal1out') allowing anyone to become owner.

## General Vulnerability & Risk Report
Here is a summary of the main bugs found in the solved levels:

| Level | Main Vulnerability | Severity | Main Impact | Recommended Mitigation 
| ----- | ----- | ----- | ----- | ----------------- |
|Fallback | Permissive receive() | High | Ownership takeover with 1 wei + full drain | Remove or protect  receive(). |
|Fallout | "Fal1out" function ( typo ) | High | Anyone can become owner and drain funds | Use `constructor()` instead of a function. 


For full details (PoC, exploit steps, on-chain), click in the links above.

## How to run the tests
```bash 
# Example for fallback level (adjust path as needed)
forge test --match-path "test/fallback/*" -vvvv 
```

## Tools & Setup 

- Foundry
- Sepolia testnet

Contributions, suggestions, or questions are welcome!