import 'package:flutter/material.dart';
import 'game_logic/tic_tac_toe_game.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  final TicTacToeGame _game = TicTacToeGame();

  void _handleTap(int row, int col) {
    if (_game.gameState == GameState.ongoing && _game.isValidMove(row, col)) {
      setState(() {
        _game.makeMove(row, col, _game.currentPlayer);
      });
    }
  }

  Widget _buildGrid() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            return GestureDetector(
              onTap: () => _handleTap(row, col),
              child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    _game.board[row][col],
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildStatusText() {
    String text;
    switch (_game.gameState) {
      case GameState.won:
        text = "${_game.currentPlayer} wins!";
        break;
      case GameState.draw:
        text = "It's a draw!";
        break;
      case GameState.ongoing:
      default:
        text = "Player ${_game.currentPlayer}'s turn";
        break;
    }
    return Text(text, style: TextStyle(fontSize: 24));
  }

  void _resetGame() {
    setState(() {
      _game.resetGame();
    });
  }

  void _undoMove() {
    setState(() {
      _game.undoMove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGrid(),
            SizedBox(height: 20),
            _buildStatusText(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _resetGame, child: Text("Reset")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _undoMove, child: Text("Undo")),
              ],
            )
          ],
        ),
      ),
    );
  }
}