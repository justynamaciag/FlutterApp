import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TicTacToeScreen extends StatefulWidget {
  @override
  TicTacToeScreenState createState() {
    return TicTacToeScreenState();
  }
}

enum Sign{
  cross,
  circle
}

extension SignExtension on Sign {
  String get symbol {
    switch (this) {
      case Sign.cross:
        return 'x';
      case Sign.circle:
        return '○';
      default:
        return null;
    }
  }

  AssetImage get image{
    switch (this) {
      case Sign.cross:
        return AssetImage("images/cross.png");
      case Sign.circle:
        return AssetImage("images/circle.png");
      default:
        return AssetImage("images/cell.png");
    }
  }
}

class TicTacToeScreenState extends State<TicTacToeScreen> {

  List<Sign> board;
  Sign sign;
  String message;
  bool newGame;

  @override
  void initState(){
    super.initState();
    setState(() {
      this.newGame = true;
      this.board = List.filled(9, null);
      this.sign = Sign.cross;
      this.message = 'User with symbol: ' + this.sign.symbol + ' turn!';
    });
  }
  void resetGame(){
    setState(() {
      this.newGame = true;
      this.board = List.filled(9, null);
      this.sign = Sign.cross;
      this.message = 'User with symbol: ' + this.sign.symbol + ' turn!';
    });
  }

  step(int index){
    if(this.board[index] == null && this.newGame){
      setState(() {
        board[index] = this.sign;
      });
    }
    if(checkIfWin()) {
      this.newGame = false;
      this.message = "Game over!\nUser with symbol: " + this.sign.symbol + " won!!!";
    }
    else {
      if (this.sign == Sign.circle)
        this.sign = Sign.cross;
      else
        this.sign = Sign.circle;
      this.message = 'User with symbol: ' + this.sign.symbol + ' turn!';
    }
  }

  checkIfWin(){
    if(board[0] != null && board[0] == board[1] && board[1] == board[2])
      return true;
    else if(board[0] != null && board[0]==board[3] && board[3] == board[6])
      return true;
    else if (board[1] != null && board[1]==board[4] && board[4] == board[7])
      return true;
    else if (board[2] != null && board[2]==board[5] && board[5] == board[8])
      return true;
    else if (board[3] != null && board[3]==board[4] && board[4] == board[5])
      return true;
    else if (board[6] != null && board[6]==board[7] && board[7] == board[8])
      return true;
    else if (board[0] != null && board[0]==board[4] && board[4] == board[8])
      return true;
    else if (board[2] != null && board[1]==board[4] && board[4] == board[6])
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffe5a9cb),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Text(this.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),)
            ),

            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                  ),
                  itemCount: this.board.length,
                  itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: (){
                      this.step(i);
                    },
                    child: Image(
                      image: this.board[i].image,
                    ),
                  )
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                )
            ),
            Container(
              padding: EdgeInsets.only(bottom: 70),
              child: RaisedButton(
                  child: const Text(
                      'Reset game!',
                      style: TextStyle(fontSize: 20)
                  ),
                 onPressed: () => resetGame(),
              ),
            )
          ],
        )
    );

  }

}

