using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cryptomon : MonoBehaviour
{
    public string cryptomonName = "";
    public int hp = 0;
    public int speed = 0;
    public move[] moves = new move[2];

    // Start is called before the first frame update
    void Start() {
        // Initialize variables from solidity
        moves[0] = new move();
        moves[1] = new move();
    }
}

public class move {
    public string moveName;
    public int damage;
    public move() {
        //Initialize variables from solidity
    }
}