using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameController : MonoBehaviour
{
    public GameObject[] cards;
    public Cryptomon[] cList;
    public int turn;
    private bool turnTimer = false;

    // Start is called before the first frame update
    void Start() {
        cards = GameObject.FindGameObjectsWithTag("Card");
        for (int i = 0; i < cards.Length; i++) {
            cList[i] = cards[i].GetComponent<Cryptomon>();
            cards[i].transform.Find("HP Text").gameObject.GetComponent<Text>().text = cList[i].hp.ToString();
            cards[i].transform.Find("Name Text").gameObject.GetComponent<Text>().text = cList[i].cryptomonName;
            cards[i].transform.Find("SPD Value Text").gameObject.GetComponent<Text>().text = cList[i].speed.ToString();
            cards[i].transform.Find("Move 1").gameObject.transform.Find("Text").GetComponent<Text>().text = cList[i].moves[0].moveName;
            cards[i].transform.Find("Move 2").gameObject.transform.Find("Text").GetComponent<Text>().text = cList[i].moves[1].moveName;
            cards[i].transform.Find("Move 1").gameObject.transform.Find("Move 1 Damage Text").GetComponent<Text>().text = cList[i].moves[0].damage.ToString();
            cards[i].transform.Find("Move 2").gameObject.transform.Find("Move 2 Damage Text").GetComponent<Text>().text = cList[i].moves[1].damage.ToString();

            cards[i].transform.Find("Move 1").GetComponent<Button>().onClick.AddListener(move1);
            cards[i].transform.Find("Move 2").GetComponent<Button>().onClick.AddListener(move2);
        }
        if (cList[0].speed < cList[1].speed) turn = 1;
        else if (cList[0].speed > cList[1].speed) turn = 0;
        else turn = Random.Range(0, cList.Length);
        setTurn(turn);
    }

    private void setTurn(int turn) {
        for (int i = 0; i < cards.Length; i++) {
            cards[i].transform.Find("Move 1").gameObject.GetComponent<Button>().interactable = false;
            cards[i].transform.Find("Move 2").gameObject.GetComponent<Button>().interactable = false;
        }
        cards[turn].transform.Find("Move 1").gameObject.GetComponent<Button>().interactable = true;
        cards[turn].transform.Find("Move 2").gameObject.GetComponent<Button>().interactable = true;
    }

    void Update() {
        if (turnTimer) {
            float timeRemaining = 0.25f;
            if (timeRemaining > 0) {
                timeRemaining -= Time.deltaTime;
            } else {
                timeRemaining = 0f;
                turnTimer = false;
            }
        }
    }

    public void move1() {
        turnTimer = true;
        //while (turnTimer) {}
        for (int i = 0; i < cards[turn].GetComponent<Cryptomon>().moves[0].damage; i++) {
            if (turn == 0) cards[1].GetComponent<Cryptomon>().hp--;
            else cards[0].GetComponent<Cryptomon>().hp--;
            cards[1].transform.Find("HP Text").gameObject.GetComponent<Text>().text = cards[1].GetComponent<Cryptomon>().hp.ToString();
            cards[0].transform.Find("HP Text").gameObject.GetComponent<Text>().text = cards[0].GetComponent<Cryptomon>().hp.ToString();
        }
        if (!areAllAlive()) gameOver();
        if (turn == 0) turn = 1;
        else turn = 0;
        setTurn(turn);
    }

    public void move2() {
        turnTimer = true;
        //while (turnTimer) {}
        for (int i = 0; i < cards[turn].GetComponent<Cryptomon>().moves[1].damage; i++) {
            if (turn == 0) cards[1].GetComponent<Cryptomon>().hp--;
            else cards[0].GetComponent<Cryptomon>().hp--;
            cards[1].transform.Find("HP Text").gameObject.GetComponent<Text>().text = cards[1].GetComponent<Cryptomon>().hp.ToString();
            cards[0].transform.Find("HP Text").gameObject.GetComponent<Text>().text = cards[0].GetComponent<Cryptomon>().hp.ToString();
        }
        if (!areAllAlive()) gameOver();
        if (turn == 0) turn = 1;
        else turn = 0;
        setTurn(turn);
    }

    private void gameOver() {

    }

    private bool areAllAlive() {
        for (int i = 0; i < cList.Length; i++)
            if (cList[i].hp >= 0) return false;
        return true;
    }
}
