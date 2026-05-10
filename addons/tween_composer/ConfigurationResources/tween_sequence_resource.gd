@tool
class_name TweenSequence
extends Resource
## TweenSequence is the resource that contains the full instructions for a tween to be created by [TweenComposer]

## Sets the name of the tween sequence. Not used in the code.
@export var sequence_name: String:
	set(value):
		sequence_name = value
		resource_name = value
		emit_changed()
	get:
		return sequence_name


@export var tween_steps: TweenStepCollection

@export_group("Duration settings")

## Total duration of tween, in seconds. [br]
## Tip: Change the duration_ratio in each [TweenConfigStep] to adjust the time of their individual tween.
@export var tween_duration: float = 1.0:
	set(value):
		tween_duration = max(0.0, value) # Blocks negative numbers

## Triggers the tween as it enters the scene.
@export var autostart: bool = true

## Adds a delay (in seconds) before the start of the tween.
@export var autostart_delay: float = 0.0:
	set(value):
		autostart_delay = max(0.0, value) # Blocks negative numbers

## Sets if the tween will be looped, or one-shot.
@export var loop: bool = true

## How many times the tween will loop before it stops. Use zero for infinite.
@export var loop_repetitions: int = 0

## Tween information is usually deleted after the tween is finished.
## Set this to [code]true[/code] if you intend to play this tween again after it stops.
## If set to [code]false[/code], the tween will need to be composed again before running.
@export var persist_tween_information: bool = false


@export_group("Parent settings")

## Sets if the parent entity will be hidden before the tween animatio begins. [br]
## Useful if the tween has an intro animation (fade-in, scale from zero, etc.).
@export var hide_parent_before_tween_start: bool = false

## Sets if the parent entity will be removed when the tween is ends. [br]
## The tween is considered "finished" after all loops have played (therefore if [loop_repetitions] 
## is set to zero, the animation will never end.
@export var delete_parent_after_tween_end:bool = false


@export_group("Other settings")

@export var ignore_time_scale: bool = false
@export var set_pause_mode: Tween.TweenPauseMode = Tween.TweenPauseMode.TWEEN_PAUSE_BOUND

## Sets which process will be used for the tween.
## Use "Physics" if the tween requires frame-independent precision, better synchrony.
@export_enum("Idle", "Physics") var process_callback: int = 0
