extends SceneTree

func _init() -> void:
    print("[Modloader Enabled]")
    modded_start()

func modded_start() -> void:
    var cwd = OS.get_executable_path().get_base_dir()
    if not DirAccess.dir_exists_absolute(cwd.path_join("modloader")):
        cwd = "user://"
    
    var pack_path = cwd.path_join("modloader").path_join("modloader.pck")
    #if OS.has_feature("macos"):
    #    pack_path = pack_path.replace("Lancer Tactics.app/Contents/MacOS/", "")
    var success = ProjectSettings.load_resource_pack(pack_path)
    #var success = ProjectSettings.load_resource_pack("/home/gavstarb/Programming/Godot/Projects/Lancer Tactics - Modded/modloader.pck")
    #var success = true
    
    if(success):
        #root.set_title(pack_path)
        root.set_title("%s (Modded)" % ProjectSettings.get_setting("application/config/name"))
        change_scene_to_file.call_deferred("res://modloader.tscn")
        #change_scene_to_file.call_deferred(ProjectSettings.get_setting("application/run/main_scene"))
    else:
        print("> Failed to find modloader pck, exiting...")
        quit()
