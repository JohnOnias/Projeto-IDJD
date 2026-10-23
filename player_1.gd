
extends CharacterBody2D

@onready var area: Area2D = $Area2D
@onready var popup: AcceptDialog = $CanvasLayer/AcceptDialog

func _ready() -> void:
	print("NPC iniciado")

	area.body_entered.connect(_on_area_body_entered)



func _on_area_body_entered(body: Node2D) -> void:
	print("Corpo detectado: ", body.name)
	print("Está no grupo player? ", body.is_in_group("npc_1"))

	if body.is_in_group("npc_1"):
		print("Abrindo popup!")
		popup.dialog_text = "E aí, parceiro? Como é que vai?"
		popup.popup_centered()
