class_name TowerBulletBasic
extends TowerBullet

@onready var bullet_collision := $CollisionShape2D as CollisionShape2D

func _ready() -> void:
	self.connect("body_entered", self.hit_enemy)
	
