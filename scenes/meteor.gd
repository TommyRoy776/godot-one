extends Area2D

var speed: int
var rotation_speed: int 
var direction_x: float

signal collision

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randf_range(-150,-50)
	position = Vector2(random_x,random_y)
	$MeteorImage.texture = get_rand_texture()
	speed = rng.randi_range(200,500) 
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40,100)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x,1.0)*speed*delta
	rotation_degrees += rotation_speed*delta
	
func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	print('body entered: ',body)
	
func get_rand_texture() -> Texture2D:
	var textures:Array[Texture2D] = [
		load("res://assets/kenney_space-shooter-redux/PNG/Meteors/meteorBrown_big1.png"),
		load("res://assets/kenney_space-shooter-redux/PNG/Meteors/meteorGrey_big1.png"),
		load("res://assets/kenney_space-shooter-redux/PNG/Meteors/meteorBrown_big2.png"),
		load("res://assets/kenney_space-shooter-redux/PNG/Meteors/meteorGrey_big4.png")
	]
	var texture_rng = RandomNumberGenerator.new()
	var random_texture_index = texture_rng.randi_range(0,len(textures)-1)
	return textures[random_texture_index]
	
func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
