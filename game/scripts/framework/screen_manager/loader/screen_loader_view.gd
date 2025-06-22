class_name ScreenLoaderView extends Control

@export_category("common")
@export var animation: AnimationPlayer


func play_show_async() -> void:
	self.visible = true
	await AnimationExtension.play_animation_async("Show", animation)
	animation.play("Idle")


func play_hide_async() -> void:
	await AnimationExtension.play_animation_async("Hide", animation)
	self.visible = false
