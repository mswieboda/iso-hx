package iso;

import iso.actions.Actions;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {
  // var map: Map;
  var player: Player;
  // var hud: HeadsUpDisplay;

  override public function create() {
    player = new Player(100, 300);
    // map = new Map();
    // hud = new HeadsUpDisplay(player);

    // Camera.setup();

    // add(map);
    add(player);
    // add(hud);

    super.create();

    Actions.addActions();
  }

  override function update(elapsed: Float) {
    super.update(elapsed);
    // Camera.update(elapsed);

    if (Actions.game.menu.triggered) Sys.exit(0);
  }
}
