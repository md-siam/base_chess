import 'dart:ui';
import 'chess_board_controller.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:chess/chess.dart' as chess;

typedef Null MoveCallback(String moveNotation);
typedef Null CheckMateCallback(String winColor);

class BoardModel extends Model {
  /// The size of the board (The board is a square)
  double size;

  /// Callback for when a move is made
  MoveCallback onMove;

  /// Callback for when a player is checkmated
  CheckMateCallback onCheckMate;

  /// Callback for when the game is a draw (Example: K v K)
  VoidCallback onDraw;

  /// If the white side of the board is towards the user
  bool whiteSideTowardsUser;

  /// The controller for programmatically making moves
  ChessBoardController chessBoardController;

  /// User moves can be enabled or disabled by this property
  bool enableUserMoves;

  /// Creates a logical game
  chess.Chess game = chess.Chess();

  /// Refreshes board
  void refreshBoard() {
    notifyListeners();
  }

  BoardModel(
      this.size,
      this.onMove,
      this.onCheckMate,
      this.onDraw,
      this.whiteSideTowardsUser,
      this.chessBoardController,
      this.enableUserMoves) {
    chessBoardController.game = game;
    chessBoardController.refreshBoard = refreshBoard;
  }
}
