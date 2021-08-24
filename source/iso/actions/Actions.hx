package iso.actions;

import flixel.FlxG;
import flixel.input.actions.FlxAction.FlxActionAnalog;
import flixel.input.actions.FlxAction.FlxActionDigital;

class Actions {
  public static var actions: ActionManager;
  public static inline var game = GameActions;
  // public static inline var menu = MenuActions;

  public static function addActions() {
    if (actions == null) actions = FlxG.inputs.add(new ActionManager());

    game.addActions(actions);
    // menu.addActions(actions);
  }
}
