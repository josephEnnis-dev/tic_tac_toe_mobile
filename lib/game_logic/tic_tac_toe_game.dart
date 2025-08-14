// lib/game_logic/tic_tac_toe_game.dart

enum GameState { ongoing, won, draw }

class TicTacToeGame {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  List<Map<String, dynamic>> moveHistory = [];
  GameState gameState = GameState.ongoing;
  String currentPlayer = 'X';

  bool isValidMove(int row, int col) => board[row][col] == '';

  void makeMove(int row, int col, String player) {
    if (isValidMove(row, col)) {
      board[row][col] = player;
      moveHistory.add({'row': row, 'col': col, 'player': player});
      updateGameState(player);
      // Switch turns after a valid move
      if (gameState == GameState.ongoing) {
        currentPlayer = player == 'X' ? 'O' : 'X';
      }
    }
  }

  void undoMove({bool isAI = false}) {
    int movesToUndo = isAI ? 2 : 1;
    for (int i = 0; i < movesToUndo; i++) {
      if (moveHistory.isNotEmpty) {
        var last = moveHistory.removeLast();
        board[last['row']][last['col']] = '';
        currentPlayer = last['player'];
      }
    }
    gameState = GameState.ongoing;
  }

  bool checkWin(String player) {
    for (int i = 0; i < 3; i++) {
      if ((board[i][0] == player &&
              board[i][1] == player &&
              board[i][2] == player) ||
          (board[0][i] == player &&
              board[1][i] == player &&
              board[2][i] == player)) return true;
    }
    if ((board[0][0] == player &&
            board[1][1] == player &&
            board[2][2] == player) ||
        (board[0][2] == player &&
            board[1][1] == player &&
            board[2][0] == player)) return true;
    return false;
  }

  bool checkDraw() =>
      board.every((row) => row.every((cell) => cell.isNotEmpty));

  void updateGameState(String player) {
    if (checkWin(player)) {
      gameState = GameState.won;
    } else if (checkDraw()) {
      gameState = GameState.draw;
    }
  }

  void resetGame() {
    board = List.generate(3, (_) => List.filled(3, ''));
    moveHistory.clear();
    gameState = GameState.ongoing;
    currentPlayer = 'X';
  }
}