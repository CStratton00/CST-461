using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameController : MonoBehaviour
{
    public GameObject[] crpytomonGameObjects;
    public Cryptomon[] cList;
    public int turn;

    // Start is called before the first frame update
    void Start() {
        crpytomonGameObjects = GameObject.FindGameObjectsWithTag("Card");
        for (int i = 0; i < crpytomonGameObjects.Length; i++) {
            cList[i] = crpytomonGameObjects[i].GetComponent<Cryptomon>();
            crpytomonGameObjects[i].transform.GetChild(3).GetComponent<Button>().onClick.AddListener(move1);
            crpytomonGameObjects[i].transform.GetChild(4).GetComponent<Button>().onClick.AddListener(move2);
        }
        if (cList[0].speed < cList[1].speed) turn = 1;
        else if (cList[0].speed > cList[1].speed) turn = 0;
        else turn = Random.Range(0, cList.Length);
        setTurn(turn);
    }

    private void setTurn(int turn) {
        for (int i = 0; i < crpytomonGameObjects.Length; i++) {
            crpytomonGameObjects[i].transform.GetChild(3).gameObject.GetComponent<Button>().interactable = false;
            crpytomonGameObjects[i].transform.GetChild(4).gameObject.GetComponent<Button>().interactable = false;
        }
        crpytomonGameObjects[turn].transform.GetChild(3).gameObject.GetComponent<Button>().interactable = true;
        crpytomonGameObjects[turn].transform.GetChild(4).gameObject.GetComponent<Button>().interactable = true;
    }

    public void move1() {

        if (gameObject == crpytomonGameObjects[0]) setTurn(1);
        else setTurn(0);
    }

    public void move2() {

        if (gameObject == crpytomonGameObjects[1]) setTurn(0);
        else setTurn(1);
    }

    // private bool areAlive() {
    //     for (int i = 0; i < cList.Length; i++) {
    //         if (cList[i].hp >= 0) return false;
    //     }
    //     return true;
    // }
}
