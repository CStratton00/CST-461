using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{
    public Cryptomon[] cList;
    public int turn;

    // Start is called before the first frame update
    void Start() {
        cList[0] = GameObject.Find("").GetComponent<Cryptomon>();
        cList[1] = GameObject.Find("").GetComponent<Cryptomon>();
        if (cList[0].speed < cList[1].speed) turn = 1;
        else if (cList[0].speed > cList[1].speed) turn = 0;
        else turn = Random.Range(0, cList.Length + 1);
    }

    // Update is called once per frame
    void Update() {
        
    }
}
