extends Area2D

export(int, "Normal", "Hidden", "Secret") var event_type

func _ready():
	if event_type > 0:
		self.visible = false

func event_visible():
	if event_type > 0:
		self.visible = true
		
func event_invisible():
	if event_type == 2:
		self.visible = false
		
func fire_event():
	# Not sure how we'll handle the event, actually
	# Array of data needed to create the scene with the dialog?
	print("EVENT TIME")