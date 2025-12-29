extends SceneTree

func _init() -> void:
    print("[Modloader Enabled]")
    modded_start()

func modded_start() -> void:
    var pack_path = OS.get_executable_path().get_base_dir().path_join("modloader").path_join("modloader.pck")
    var success = ProjectSettings.load_resource_pack(pack_path)
    #var success = ProjectSettings.load_resource_pack("/home/gavstarb/Programming/Godot/Projects/Lancer Tactics - Modded/modloader.pck")
    
    if(success):
        root.set_title("%s (Modded)" % ProjectSettings.get_setting("application/config/name"))
        change_scene_to_file.call_deferred("res://modloader.tscn")
        #change_scene_to_file.call_deferred(ProjectSettings.get_setting("application/run/main_scene"))
    else:
        print("> Failed to find modloader pck, exiting...")
        quit()
