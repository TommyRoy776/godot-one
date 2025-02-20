extends CanvasLayer

var image = load('res://assets/kenney_space-shooter-redux/PNG/UI/playerLife1_red.png')

func set_health(amount):
	print(amount,'ui')
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
