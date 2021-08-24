package iso;

import iso.actions.Actions;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import flixel.util.FlxPath;

class Player extends FlxGroup {
  static inline var WIDTH: Int = 64;
  static inline var HEIGHT: Int = 64;

  static inline var MOVEMENT_ACCELERATION: Int = 640;
  static inline var DRAG: Int = 640;

  var sprite: FlxSprite;

  public function new(
    x: Float = 0,
    y: Float = 0
  ) {
    super();

    sprite = new FlxSprite(x, y);
    sprite.loadGraphic(AssetPaths.player__png, false, WIDTH, HEIGHT);
    // sprite.immovable = true;

    sprite.drag.set(DRAG, DRAG);

    add(sprite);
  }

  override function update(elapsed: Float) {
    super.update(elapsed);

    updateMovement();
  }

  function updateMovement() {
    var left = Actions.game.left.triggered;
    var right = Actions.game.right.triggered;
    var down = Actions.game.down.triggered;
    var up = Actions.game.up.triggered;

    if (left && right) left = right = false;
    if (down && up) up = down = false;

    sprite.acceleration.x = 0;

    if (left) {
      sprite.facing = FlxObject.LEFT;
      sprite.acceleration.x -= MOVEMENT_ACCELERATION;
    } else if (right) {
      sprite.facing = FlxObject.RIGHT;
      sprite.acceleration.x += MOVEMENT_ACCELERATION;
    }
  }
}
