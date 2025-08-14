This is a mobile Tic Tac Toe game developed using **Flutter** and **Dart**  
It will include multiple AI difficulty levels, persistent score tracking, and undo functionality.

The project is intended to demonstrate:
- Advanced mobile app design and logic.
- Understanding of mobile device environment features.
- Practical mobile app programming skills.

---

## Features to be implemented
- **3×3 grid gameplay** with legal move validation.
- **Human vs AI** matches with three difficulty modes:
  - **Easy**: AI plays entirely random moves.
  - **Medium**: AI starts with a random move, then alternates between random moves and a predefined winning strategy.
  - **Hard**: AI uses a predefined strategy every turn.
- **Persistent scoring**: Tracks total wins, losses, and draws across sessions using local storage.
- **Undo last move**:
  - Removes the last player move.
  - If playing vs AI, also removes the AI’s last move (full turn rewind).
- **Outcome display**: Shows the winner or draw result at the end of each match.

---

## Game Rules
- A player wins by placing **three of their marks (X or O)** in a straight line:
  - Horizontally across any row.
  - Vertically down any column.
  - Diagonally across the board.
- If all cells are filled without a winner, the game ends in a draw.