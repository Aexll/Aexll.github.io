GDPC                                                                                      #   `   res://.godot/exported/133200997/export-3f6dfedcd5ab4046d211567bf6df0470-DebugDrawDemoScene.scn   [      �F      ��� �6�+;�����    X   res://.godot/exported/133200997/export-67c7b68c84acef1ab54c2d40f3c07f4c-main_scene.scn  0K     �      ��n&v�UnEO�O����    `   res://.godot/exported/133200997/export-ddb3131f8faccbc76d84042100d0a082-DebugDrawDemoSceneCS.scn�            dը*?����U�Ow��    X   res://.godot/exported/133200997/export-e7de4a5fa3dad1fa22f4b34ade96ef28-addon_icon.scn        w      &�طQ���8V7'��    X   res://.godot/exported/133200997/export-f93991d115d1eceffb5087fa5a56be35-Path_tileset.res��     �      ��́
� zp�7R�N    ,   res://.godot/global_script_class_cache.cfg  ��            ��Р�8���8~$}P�    D   res://.godot/imported/Path.svg-34733e0df181de450e1f532098e86d8f.ctexP�     .      M��b��+��>�
<�	    L   res://.godot/imported/Path_Arrows.svg-3d5516653b8e63b2aef2f6c7852d2088.ctex @�     �      * 緎Ufn1��Ȗ"    P   res://.godot/imported/Path_Arrows_Dot.svg-68f27e0f2dc59dcc2dbc6d7d9969e350.ctex ��            I��������?�ֺ�    P   res://.godot/imported/Path_Conveyor.svg-c38bc0143497f1d1817d09f71b4db01f.ctex   ��           ��-�����/ᘰ�1�    P   res://.godot/imported/Roboto-Bold.ttf-3674de3d9ad3ee757cd4b4a89f1e126d.fontdata 0�      L�     H�����Ȯ��ix|    H   res://.godot/imported/Skull.png-f379d7f6066c52f0d53ceb433eaf024f.ctex   p     `�      zrGJAg�ѥ����    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex��     �      �̛�*$q�*�́        res://.godot/uid_cache.bin             )g��!$�E�j��9K�    (   res://Main/Scenes/main_scene.tscn.remap ��     g       �L�L.~5�:`4�%p    $   res://Main/Scripts/CameraMovement.gd�N           ��z��S��EG�KHW8    $   res://Main/Scripts/IconRotation.gd   S            ��q���?v�ե�P���    $   res://Main/Scripts/TileManager.gd    T     t2      e����px�,�;=    ,   res://Main/Tilesets/Path_tileset.tres.remap �     i       9��7��L[�����g        res://Ressources/Path.svg.import��     �       Ld[�����+����    (   res://Ressources/Path_Arrows.svg.import ��     �       A�E*�^"y�Z�q��     ,   res://Ressources/Path_Arrows_Dot.svg.import ��     �       t��pLGf�����6T�    ,   res://Ressources/Path_Conveyor.svg.import   �     �       u&1VXb%�?�6���       res://Ressources/Skull.png  `�     �     �u}��l�&ۘ�?�    $   res://Ressources/Skull.png.import   ��     �       d����Y�f�9aS�d    ,   res://examples_dd3d/DebugDrawDemoScene.gd   �      �J      a��6������9E���    4   res://examples_dd3d/DebugDrawDemoScene.tscn.remap   ��     o       :�VUy7K9�i%C    4   res://examples_dd3d/DebugDrawDemoSceneCS.tscn.remap  �     q       P%V����;I^�m?`    ,   res://examples_dd3d/Roboto-Bold.ttf.import  �J     �       �M6xj�΅�]����    $   res://examples_dd3d/addon_icon.gd                 `U���Ħ��Bk%)l`    ,   res://examples_dd3d/addon_icon.tscn.remap   @�     g       �En�0�k���%z/R�    $   res://examples_dd3d/load_unload.gd  �            ��t���ךN"�       res://icon.svg  ��     �      C��=U���^Qu��U3       res://icon.svg.import   ��     �       ��E��ں��d�M,       res://project.binary0     �      \^��>���S��y�    ؒ�hUP@tool
extends Node3D

func _process(delta: float) -> void:
	DebugDraw3D.draw_box_xf($box.global_transform, Color.GREEN)
	DebugDraw3D.draw_gizmo($gizmo.global_transform)
	DebugDraw3D.draw_grid_xf($gizmo/grid.global_transform, Vector2i(2,2), DebugDraw3D.empty_color, false)
	DebugDraw3D.draw_sphere_xf($sphere.global_transform, Color.RED)
	DebugDraw3D.draw_cylinder($cylinder.global_transform, Color.BLUE)
	DebugDraw3D.draw_line_hit_offset($"line/1".global_transform.origin, $"line/2".global_transform.origin, true, 0.3, 0.1)
��?CRSRC                    PackedScene            ��������                                            b      resource_local_to_scene    resource_name    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    script 	   _bundled       Script "   res://examples_dd3d/addon_icon.gd ��������   
   local://1 c	         local://PackedScene_rgddj �	         Environment             `         PackedScene    a      	         names "         icon    script    Node3D    Camera 
   transform    environment    current 	   Camera3D    box    gizmo    grid    sphere 	   cylinder    line    1    2    	   variants                      �?              �?              �?        ض�@                   ��>���<~:��&Su��)�>&Su��.>_'�>ׄT>Ҿ`�>)	y>   �5?    �5�穖�~�h?穖���$?#�>��$?                 �?�������3      �?    ���3����  �?��׼%����׼   �|�>��T>��߾���B@�>�Xq��8>��>zr�>`��>Y4�>?M>   0>5��=�n�$*$���>sM��:��<bH>:�2>H8h�b���	�g?     �?              �?              �?w�?Ů�H'?     �?              �?              �?�O�;�a�>A��=      node_count    
         nodes     \   ��������       ����                            ����                                       ����                        	   ����                       
   ����                           ����                           ����                           ����                     ����      	                    ����      
             conn_count              conns               node_paths              editable_instances              version       `      RSRC&J����n@tool
extends Node3D

@export var custom_font : Font
@export var zylann_example := false
@export var test_text := true
@export var test_graphs := false
@export var more_test_cases := true
@export var draw_array_of_boxes := false
@export_range(0, 1024) var start_culling_distance := 0.0

@export_group("Text groups", "text_groups")
@export var text_groups_show_hints := true
@export var text_groups_show_stats := false
@export var text_groups_show_stats_2d := false
@export var text_groups_position := DebugDrawConfig2D.POSITION_LEFT_TOP
@export var text_groups_offset := Vector2i(8, 8)
@export var text_groups_padding := Vector2i(3, 1)
@export_range(1, 100) var text_groups_default_font_size := 12
@export_range(1, 100) var text_groups_title_font_size := 14
@export_range(1, 100) var text_groups_text_font_size := 12

@export_group("Graphs", "graph")
@export var graph_offset := Vector2i(8, 8)
@export var graph_size := Vector2i(200, 80)
@export_range(1, 100) var graph_title_font_size := 14
@export_range(1, 100) var graph_text_font_size := 12
@export_range(0, 64) var graph_text_precision := 2
@export_range(1, 32) var graph_line_width := 1.0
@export_range(1, 512) var graph_buffer_size := 128
@export var graph_frame_time_mode := true
@export var graph_is_enabled := true

var button_presses := {}
var time := 0.0
var time2 := 0.0
var time3 := 0.0
var time_text := 0.0

func _ready() -> void:
	_update_keys_just_press()
	
	await get_tree().process_frame
	
	# this check is required for inherited scenes, because an instance of this 
	# script is created first, and then overridden by another
	if !is_inside_tree():
		return


func _is_key_just_pressed(key):
	if (button_presses[key] == 1):
		button_presses[key] = 2
		return true
	return false


func _update_keys_just_press():
	var set_key = func (k: Key): return (1 if button_presses[k] == 0 else button_presses[k]) if Input.is_key_pressed(k) else 0
	button_presses[KEY_LEFT] = set_key.call(KEY_LEFT)
	button_presses[KEY_UP] = set_key.call(KEY_UP)
	button_presses[KEY_F1] = set_key.call(KEY_F1)
	button_presses[KEY_1] = set_key.call(KEY_1)
	button_presses[KEY_2] = set_key.call(KEY_2)
	button_presses[KEY_3] = set_key.call(KEY_3)


func _process(delta: float) -> void:
	_update_keys_just_press()
	
	if _is_key_just_pressed(KEY_F1):
		zylann_example = !zylann_example
	
	# Zylann's example :D
	if zylann_example:
		DebugDraw2D.clear_graphs()
		var _time = Time.get_ticks_msec() / 1000.0
		var box_pos = Vector3(0, sin(_time * 4), 0)
		var line_begin = Vector3(-1, sin(_time * 4), 0)
		var line_end = Vector3(1, cos(_time * 4), 0)
		
		DebugDraw3D.draw_box(box_pos, Vector3(1, 2, 1), Color(0, 1, 0))
		DebugDraw3D.draw_line(line_begin, line_end, Color(1, 1, 0))
		DebugDraw2D.set_text("Time", _time)
		DebugDraw2D.set_text("Frames drawn", Engine.get_frames_drawn())
		DebugDraw2D.set_text("FPS", Engine.get_frames_per_second())
		DebugDraw2D.set_text("delta", delta)
		$HitTest.visible = false
		$LagTest.visible = false
		return
	
	$HitTest.visible = true
	$LagTest.visible = true
	
	# Testing the rendering layers by showing the image from the second camera inside the 2D panel
	DebugDraw3D.config.geometry_render_layers = 1 if !Input.is_key_pressed(KEY_SHIFT) else 0b10010
	$Panel.visible = Input.is_key_pressed(KEY_SHIFT)
	DebugDraw2D.custom_canvas = $CustomCanvas if Input.is_key_pressed(KEY_SHIFT) else null
	
	# More property toggles
	DebugDraw3D.config.freeze_3d_render = Input.is_key_pressed(KEY_DOWN)
	DebugDraw3D.config.visible_instance_bounds = Input.is_key_pressed(KEY_RIGHT)
	
	# Some property toggles
	if _is_key_just_pressed(KEY_LEFT):
		DebugDraw3D.config.use_frustum_culling = !DebugDraw3D.config.use_frustum_culling
	if _is_key_just_pressed(KEY_UP):
		DebugDraw3D.config.force_use_camera_from_scene = !DebugDraw3D.config.force_use_camera_from_scene
	
	if _is_key_just_pressed(KEY_1):
		DebugDraw3D.debug_enabled = !DebugDraw3D.debug_enabled
	if _is_key_just_pressed(KEY_2):
		DebugDraw2D.debug_enabled = !DebugDraw2D.debug_enabled
	if _is_key_just_pressed(KEY_3):
		DebugDrawManager.debug_enabled = !DebugDrawManager.debug_enabled
	
	
	if Engine.is_editor_hint():
		DebugDraw3D.config.cull_by_distance = start_culling_distance if DebugDraw3D.config.force_use_camera_from_scene else 0.0
	else:
		DebugDraw3D.config.cull_by_distance = start_culling_distance
	
	# Zones with black borders
	for z in $Zones.get_children():
		DebugDraw3D.draw_box_xf(z.global_transform, Color.BLACK)
	
	# Spheres
	DebugDraw3D.draw_sphere_xf($SphereTransform.global_transform, Color.CRIMSON)
	DebugDraw3D.draw_sphere_hd_xf($SphereHDTransform.global_transform, Color.ORANGE_RED)
	
	# Delayed spheres
	if time <= 0:
		DebugDraw3D.draw_sphere($SpherePosition.global_transform.origin, 2.0, Color.BLUE_VIOLET, 2.0)
		DebugDraw3D.draw_sphere_hd($SpherePosition.global_transform.origin + Vector3.FORWARD * 4, 2.0, Color.CORNFLOWER_BLUE, 2.0)
		time = 2
	time -= delta
	
	# Cylinders
	DebugDraw3D.draw_cylinder($Cylinder1.global_transform, Color.CRIMSON)
	DebugDraw3D.draw_cylinder(Transform3D(Basis.IDENTITY, $Cylinder2.global_transform.origin).scaled(Vector3(1,2,1)), Color.RED)
	
	# Boxes
	DebugDraw3D.draw_box_xf($Box1.global_transform, Color.MEDIUM_PURPLE)
	DebugDraw3D.draw_box($Box2.global_transform.origin, Vector3.ONE, Color.REBECCA_PURPLE)
	DebugDraw3D.draw_box_xf(Transform3D(Basis(Vector3.UP, PI * 0.25).scaled(Vector3.ONE * 2), $Box3.global_transform.origin), Color.ROSY_BROWN)
	
	DebugDraw3D.draw_box_xf($BoxOutOfDistanceCulling.global_transform, Color.RED)
	
	DebugDraw3D.draw_aabb(AABB($AABB_fixed.global_transform.origin, Vector3(2, 1, 2)), Color.AQUA)
	DebugDraw3D.draw_aabb_ab($AABB.get_child(0).global_transform.origin, $AABB.get_child(1).global_transform.origin, Color.DEEP_PINK)
	
	# Lines
	var target = $Lines/Target
	DebugDraw3D.draw_square(target.global_transform.origin, 0.5, Color.RED)
	
	DebugDraw3D.draw_line($"Lines/1".global_transform.origin, target.global_transform.origin, Color.FUCHSIA)
	DebugDraw3D.draw_ray($"Lines/3".global_transform.origin, (target.global_transform.origin - $"Lines/3".global_transform.origin).normalized(), 3.0, Color.CRIMSON)
	
	if time3 <= 0:
		DebugDraw3D.draw_line($"Lines/6".global_transform.origin, target.global_transform.origin, Color.FUCHSIA, 2.0)
		time3 = 2
	time3 -= delta
	
	# Lines with Arrow
	DebugDraw3D.draw_arrow_line($"Lines/2".global_transform.origin, target.global_transform.origin, Color.BLUE, 0.5, true)
	DebugDraw3D.draw_arrow_ray($"Lines/4".global_transform.origin, (target.global_transform.origin - $"Lines/4".global_transform.origin).normalized(), 8.0, Color.LAVENDER, 0.5, true)
	
	DebugDraw3D.draw_line_hit_offset($"Lines/5".global_transform.origin, target.global_transform.origin, true, abs(sin(Time.get_ticks_msec() / 1000.0)), 0.25, Color.AQUA)
	
	# Path
	
	## preparing data
	var points: PackedVector3Array = []
	var points_below: PackedVector3Array = []
	var points_below2: PackedVector3Array = []
	var points_below3: PackedVector3Array = []
	var lines_above: PackedVector3Array = []
	for c in $LinePath.get_children():
		points.append(c.global_transform.origin)
		points_below.append(c.global_transform.origin + Vector3.DOWN)
		points_below2.append(c.global_transform.origin + Vector3.DOWN * 2)
		points_below3.append(c.global_transform.origin + Vector3.DOWN * 3)
	for x in points.size()-1:
		lines_above.append(points[x] + Vector3.UP)
		lines_above.append(points[x+1] + Vector3.UP)
	
	## drawing lines
	DebugDraw3D.draw_lines(lines_above)
	DebugDraw3D.draw_line_path(points, Color.BEIGE)
	DebugDraw3D.draw_arrow_path(points_below, Color.GOLD, 0.5)
	DebugDraw3D.draw_points(points_below2, 0.2, Color.DARK_GREEN)
	DebugDraw3D.draw_point_path(points_below3, 0.25, Color.BLUE, Color.TOMATO)
	
	# Misc
	#for i in 1000:
	DebugDraw3D.draw_camera_frustum($Camera, Color.DARK_ORANGE)
	
	DebugDraw3D.draw_arrow($Misc/Arrow.global_transform, Color.YELLOW_GREEN)
	
	DebugDraw3D.draw_square($Misc/Billboard.global_transform.origin, 0.5, Color.GREEN)
	
	DebugDraw3D.draw_position($Misc/Position.global_transform, Color.BROWN)
	
	DebugDraw3D.draw_gizmo($Misc/GizmoTransform.global_transform, DebugDraw3D.empty_color, true)
	DebugDraw3D.draw_gizmo($Misc/GizmoNormal.global_transform.orthonormalized(), DebugDraw3D.empty_color, false)
	DebugDraw3D.draw_gizmo($Misc/GizmoOneColor.global_transform, Color.BROWN, true)
	
	var tg : Transform3D = $Misc/Grids/Grid.global_transform
	var tn : Vector3 = $Misc/Grids/Grid/Subdivision.transform.origin
	DebugDraw3D.draw_grid(tg.origin, tg.basis.x, tg.basis.z, Vector2i(int(tn.x*10), int(tn.z*10)), Color.LIGHT_CORAL, false)
	
	var tn1 = $Misc/Grids/GridCentered/Subdivision.transform.origin
	DebugDraw3D.draw_grid_xf($Misc/Grids/GridCentered.global_transform, Vector2i(tn1.x*10, tn1.z*10))
	
	# 2D
	DebugDraw2D.config.text_default_size = text_groups_default_font_size
	DebugDraw2D.config.text_block_offset = text_groups_offset
	DebugDraw2D.config.text_block_position = text_groups_position
	DebugDraw2D.config.text_padding = text_groups_padding
	
	DebugDraw2D.config.text_custom_font = custom_font
	
	if test_text:
		time_text -= delta
		_text_tests()
	
	# Graphs
	# Enable FPSGraph if not exists
	_create_graph(&"FPS", true, false, DebugDrawGraph.TEXT_CURRENT | DebugDrawGraph.TEXT_AVG | DebugDrawGraph.TEXT_MAX | DebugDrawGraph.TEXT_MIN, &"", DebugDrawGraph.SIDE_BOTTOM, DebugDrawGraph.POSITION_LEFT_TOP if Engine.is_editor_hint() else DebugDrawGraph.POSITION_RIGHT_TOP, Vector2i(200, 80), custom_font)
	if Engine.is_editor_hint():
		if DebugDraw2D.get_graph(&"FPS"):
			DebugDraw2D.get_graph(&"FPS").offset = Vector2i(0, 64)
	
	# Adding more graphs
	if test_graphs and DebugDraw2D.debug_enabled:
		_graph_test()
	else:
		_remove_graphs()
	_upd_graph_params()
	
	# Lag Test
	$LagTest.position = $LagTest/RESET.get_animation("RESET").track_get_key_value(0,0) + Vector3(sin(Time.get_ticks_msec() / 100.0) * 2.5, 0, 0)
	DebugDraw3D.draw_box($LagTest.global_transform.origin, Vector3.ONE * 2.01, DebugDraw3D.empty_color, true)
	
	if more_test_cases:
		for ray in $HitTest/RayEmitter.get_children():
			ray.set_physics_process_internal(true)
		
		_more_tests()
	else:
		for ray in $HitTest/RayEmitter.get_children():
			ray.set_physics_process_internal(false)
	
	if draw_array_of_boxes:
		_draw_array_of_boxes()


func _text_tests():
	if time_text < 0:
		DebugDraw2D.set_text("Some delayed text", "for 2.5s", -1, Color.BLACK, 2.5) # it's supposed to show text for 2.5 seconds
		time_text += 5
	
	DebugDraw2D.set_text("FPS", "%.2f" % Engine.get_frames_per_second(), 0, Color.GOLD)
	
	DebugDraw2D.begin_text_group("-- First Group --", 2, Color.LIME_GREEN, true, text_groups_title_font_size, text_groups_text_font_size)
	DebugDraw2D.set_text("Simple text")
	DebugDraw2D.set_text("Text", "Value", 0, Color.AQUAMARINE)
	DebugDraw2D.set_text("Text out of order", null, -1, Color.SILVER)
	DebugDraw2D.begin_text_group("-- Second Group --", 1, Color.BEIGE)
	DebugDraw2D.set_text("Rendered frames", Engine.get_frames_drawn())
	DebugDraw2D.end_text_group()
	
	if text_groups_show_stats or text_groups_show_stats_2d:
		DebugDraw2D.begin_text_group("-- Stats --", 3, Color.WHEAT)
		
		var render_stats := DebugDraw3D.get_render_stats()
		if render_stats && text_groups_show_stats:
			DebugDraw2D.set_text("Total", render_stats.total_geometry)
			DebugDraw2D.set_text("Instances", render_stats.instances, 1)
			DebugDraw2D.set_text("Lines", render_stats.lines, 2)
			DebugDraw2D.set_text("Total Visible", render_stats.total_visible, 3)
			DebugDraw2D.set_text("Visible Instances", render_stats.visible_instances, 4)
			DebugDraw2D.set_text("Visible Lines", render_stats.visible_lines, 5)
			
			DebugDraw2D.set_text("---", null, 6)
			
			DebugDraw2D.set_text("Culling time", "%.2f ms" % (render_stats.total_time_culling_usec / 1000.0), 7)
			DebugDraw2D.set_text("Filling instances buffer", "%.2f ms" % (render_stats.time_filling_buffers_instances_usec / 1000.0), 8)
			DebugDraw2D.set_text("Filling lines buffer", "%.2f ms" % (render_stats.time_filling_buffers_lines_usec / 1000.0), 9)
			DebugDraw2D.set_text("Filling time", "%.2f ms" % (render_stats.total_time_filling_buffers_usec / 1000.0), 10)
			DebugDraw2D.set_text("Total time", "%.2f ms" % (render_stats.total_time_spent_usec / 1000.0), 11)
		
		if text_groups_show_stats && text_groups_show_stats_2d:
			DebugDraw2D.set_text("----", null, 19)
		
		var render_stats_2d := DebugDraw2D.get_render_stats()
		if render_stats_2d && text_groups_show_stats_2d:
			DebugDraw2D.set_text("Text groups", render_stats_2d.overlay_text_groups, 20)
			DebugDraw2D.set_text("Text lines", render_stats_2d.overlay_text_lines, 21)
			DebugDraw2D.set_text("Graphs total", render_stats_2d.overlay_graphs_total, 22)
			DebugDraw2D.set_text("Graphs enabled", render_stats_2d.overlay_graphs_enabled, 23)
			
		DebugDraw2D.end_text_group()
	
	if text_groups_show_hints:
		DebugDraw2D.begin_text_group("controls", 1024, Color.WHITE, false)
		DebugDraw2D.set_text("Shift: change render layers", DebugDraw3D.config.geometry_render_layers, 1)
		DebugDraw2D.set_text("Down: freeze render", DebugDraw3D.config.freeze_3d_render, 2)
		DebugDraw2D.set_text("Up: use scene camera", DebugDraw3D.config.force_use_camera_from_scene, 3)
		DebugDraw2D.set_text("1,2,3: toggle debug", "%s, %s 😐, %s 😏" % [DebugDraw3D.debug_enabled, DebugDraw2D.debug_enabled, DebugDrawManager.debug_enabled], 4)
		DebugDraw2D.set_text("Left: toggle frustum culling", DebugDraw3D.config.use_frustum_culling, 5)
		DebugDraw2D.set_text("Right: draw bounds for culling", DebugDraw3D.config.visible_instance_bounds, 6)


func _more_tests():
	# Line hits render
	for ray in $HitTest/RayEmitter.get_children():
		if ray is RayCast3D:
			DebugDraw3D.draw_line_hit(ray.global_transform.origin, ray.to_global(ray.target_position), ray.get_collision_point(), ray.is_colliding(), 0.15)
	
		# Delayed line render
	DebugDraw3D.draw_line($LagTest.global_transform.origin + Vector3.UP, $LagTest.global_transform.origin + Vector3(0,3,sin(Time.get_ticks_msec() / 50.0)), DebugDraw3D.empty_color, 0.5)


func _draw_array_of_boxes():
	# Lots of boxes to check performance.. I guess..
	if time2 <= 0:
		for x in 50:
			for y in 50:
				for z in 3:
					DebugDraw3D.draw_box(Vector3(x, -4-z, y), Vector3.ONE, DebugDraw3D.empty_color, false, 1.25)
		time2 = 1.25
	time2 -= get_process_delta_time()


func _graph_test():
# warning-ignore:return_value_discarded
	_create_graph(&"fps", true, true, DebugDrawGraph.TEXT_CURRENT, &"", DebugDrawGraph.SIDE_LEFT, DebugDrawGraph.POSITION_RIGHT_TOP)
# warning-ignore:return_value_discarded
	_create_graph(&"fps2", true, false, DebugDrawGraph.TEXT_CURRENT, &"fps", DebugDrawGraph.SIDE_BOTTOM, 0, Vector2i(200, 100))
# warning-ignore:return_value_discarded
	_create_graph(&"Sin Wave!", false, true, DebugDrawGraph.TEXT_CURRENT, &"fps2", DebugDrawGraph.SIDE_BOTTOM)
	
# warning-ignore:return_value_discarded
	_create_graph(&"randf", false, true, DebugDrawGraph.TEXT_AVG, &"", DebugDrawGraph.SIDE_LEFT, DebugDrawGraph.POSITION_RIGHT_BOTTOM, Vector2i(256, 60), custom_font)
# warning-ignore:return_value_discarded
	_create_graph(&"fps5", true, true, DebugDrawGraph.TEXT_ALL, &"randf", DebugDrawGraph.SIDE_TOP)
# warning-ignore:return_value_discarded
	_create_graph(&"fps6", true, true, DebugDrawGraph.TEXT_ALL, &"fps5", DebugDrawGraph.SIDE_TOP)
# warning-ignore:return_value_discarded
	_create_graph(&"fps12", true, true, DebugDrawGraph.TEXT_ALL, &"fps5", DebugDrawGraph.SIDE_LEFT)
	
# warning-ignore:return_value_discarded
	_create_graph(&"fps7", true, false, DebugDrawGraph.TEXT_ALL, &"FPS", DebugDrawGraph.SIDE_BOTTOM)
# warning-ignore:return_value_discarded
	_create_graph(&"fps8", true, true, DebugDrawGraph.TEXT_ALL, &"", DebugDrawGraph.SIDE_TOP, DebugDrawGraph.POSITION_LEFT_BOTTOM)
# warning-ignore:return_value_discarded
	_create_graph(&"fps9", true, false, DebugDrawGraph.TEXT_ALL, &"fps8", DebugDrawGraph.SIDE_RIGHT)
# warning-ignore:return_value_discarded
	_create_graph(&"fps10", true, false, DebugDrawGraph.TEXT_ALL, &"fps8", DebugDrawGraph.SIDE_TOP)
	# warning-ignore:return_value_discarded
	_create_graph(&"fps11", true, true, DebugDrawGraph.TEXT_ALL, &"fps9", DebugDrawGraph.SIDE_RIGHT)
	# warning-ignore:return_value_discarded
	_create_graph(&"fps13", true, true, DebugDrawGraph.TEXT_ALL, &"", DebugDrawGraph.SIDE_RIGHT)
	if not DebugDraw2D.get_graph(&"fps13"):
		return
	
	DebugDraw2D.get_graph(&"fps13").enabled = false
	
	# If graphs exists, then more tests are done
	DebugDraw2D.get_graph(&"Sin Wave!").data_getter = Callable(self, &"_get_sin_wave_for_graph")
	DebugDraw2D.get_graph(&"Sin Wave!").upside_down =false
	
	DebugDraw2D.get_graph(&"randf").text_suffix = "utf8 ноль zéro"
	#DebugDraw2D.get_graph(&"fps9").line_position = DebugDrawGraph.LINE_TOP
	DebugDraw2D.get_graph(&"fps9").offset = Vector2i(0, 0)
	#DebugDraw2D.get_graph(&"fps11").line_position = DebugDrawGraph.LINE_BOTTOM
	DebugDraw2D.get_graph(&"fps11").offset = Vector2i(16, 0)
	DebugDraw2D.get_graph(&"fps6").offset = Vector2i(0, 32)
	DebugDraw2D.get_graph(&"fps").offset = Vector2i(16, 72)
	
	DebugDraw2D.get_graph(&"fps9").enabled = graph_is_enabled
	if !Engine.is_editor_hint():
		DebugDraw2D.get_graph(&"fps").corner = DebugDrawGraph.POSITION_LEFT_TOP
	
	# Just sending random data to the graph
	DebugDraw2D.graph_update_data(&"randf", randf())


func _upd_graph_params():
	DebugDraw2D.config.graphs_base_offset = graph_offset
	for g in [&"FPS", &"fps5", &"fps8"]:
		var graph := DebugDraw2D.get_graph(g) as DebugDrawFPSGraph
		if graph:
			graph.size = graph_size
			graph.title_size = graph_title_font_size
			graph.text_size = graph_text_font_size
			graph.line_width = graph_line_width
			graph.text_precision = graph_text_precision
			graph.buffer_size = graph_buffer_size
			if Engine.is_editor_hint() or g != &"FPS":
				graph.frame_time_mode = graph_frame_time_mode


func _get_sin_wave_for_graph() -> float:
	var mul = 4 if Input.is_key_pressed(KEY_END) else 2
	return sin(Engine.get_frames_drawn() * 0.5) * mul


func _remove_graphs():
	DebugDraw2D.remove_graph(&"randf")
	DebugDraw2D.remove_graph(&"fps")
	DebugDraw2D.remove_graph(&"fps2")
	DebugDraw2D.remove_graph(&"Sin Wave!")
	DebugDraw2D.remove_graph(&"fps5")
	DebugDraw2D.remove_graph(&"fps6")
	DebugDraw2D.remove_graph(&"fps7")
	DebugDraw2D.remove_graph(&"fps8")
	DebugDraw2D.remove_graph(&"fps9")
	DebugDraw2D.remove_graph(&"fps10")
	DebugDraw2D.remove_graph(&"fps11")
	DebugDraw2D.remove_graph(&"fps12")
	DebugDraw2D.remove_graph(&"fps13")


func _create_graph(title, is_fps, show_title, flags, parent := &"", parent_side := DebugDrawGraph.SIDE_BOTTOM, pos = DebugDrawGraph.POSITION_LEFT_BOTTOM, size := Vector2i(256, 60), font = null) -> DebugDrawGraph:
	var graph := DebugDraw2D.get_graph(title)
	if !graph:
		if is_fps:
			graph = DebugDraw2D.create_fps_graph(title)
		else:
			graph = DebugDraw2D.create_graph(title)
		
		if graph:
			graph.size = size
			graph.buffer_size = 50
			graph.corner = pos
			graph.show_title = show_title
			graph.show_text_flags = flags
			graph.custom_font = font
			graph.set_parent(parent, parent_side)
	
	return graph
	RSRC                    PackedScene            ��������                                            �      .. 	   LinePath 	   Spatial2 
   transform 	   Spatial5 	   Spatial4    RayEmitter    . 	   position    resource_local_to_scene    resource_name    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    tracks/2/type    tracks/2/imported    tracks/2/enabled    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/keys    script    _data    custom_solver_bias    margin    radius    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    default_base_scale    default_font    default_font_size    script/source 	   _bundled       Script *   res://examples_dd3d/DebugDrawDemoScene.gd ��������	   FontFile $   res://examples_dd3d/Roboto-Bold.ttf j	-��b   
   local://9 �         local://10 �         local://AnimationLibrary_nj4nv �      
   local://4 	      
   local://5 3      
   local://6 �      
   local://7 E         local://AnimationLibrary_vh8ml _      
   local://1 �      
   local://8 
         local://AnimationLibrary_a7f1a       
   local://3 c      
   local://2 y         local://PackedScene_yqa5m 3       
   Animation    
      	   New Anim         �?                  value                                                                   times !          333?      transitions !        �?  �?      values            �?              �?              �?   @  �?  �?     �?              �?              �?   @���>  �?      update                 value                                                                   times !             ?      transitions !        �?  �?      values            �?              �?              �?   �  ��  �?     �?              �?              �?   ��@ʿ  �?      update                 value                                            !         "               times !            �?      transitions !        �?  �?      values            �?              �?              �?-%�    _��?     �?              �?              �?-%��J�_��?      update        #      
   Animation          o�:         value                                                                   times !                transitions !        �?      values            �?              �?              �?   @  �?  �?      update                 value                                                                   times !                transitions !        �?      values            �?              �?              �?   �  ��  �?      update                 value                                            !         "               times !                transitions !        �?      values            �?              �?              �?-%�    _��?      update        #         AnimationLibrary    $            	   New Anim                 RESET          #         SphereShape3D    '        �?#         StandardMaterial3D    *         5      ��?��?��:?���>@         A      ��@?��=?��\?  �?#      
   Animation    
      	   New Anim         @@                  rotation_3d                                                     !            �?              �?ff�?  �?�$�55@�����  �?33@  �?T8"�za=�{?g*�         position_3d                                                     !            �?!����@�Q�   ?  �?X7j?,}�?!Խff�?  �?�r<�@v�33@  �?��?�ɳ?O�?#      
   Animation          o�:         position_3d                                                     !            �?!����@�Q�         rotation_3d                                                     !            �?              �?#         AnimationLibrary    $            	   New Anim                RESET          #         StandardMaterial3D    /          5      ��?���=���=  �?#      
   Animation 
   
         RESET       o�:         value                                                                   times !                transitions !        �?      values          �+'A�+��f��      update        #         AnimationLibrary    $               RESET       	   #         Theme    #      	   GDScript    �      �  @tool
extends Control

@export var switch_to_scene = ""

var frames := 0

func _process(_delta):
	frames += 1
	if frames == 3:
		_deferred_init()
		set_process(false)

func _deferred_init():
	$GC/VB/H/Button.disabled = true
	
	var test := DebugDraw2D.get_graph(&"FPS")
	if test:
		$GC/VB/H/FPSEnabled.button_pressed = test.enabled
		$GC/VB/FPSMS.button_pressed = test.frame_time_mode
		$GC/VB/HSlider.value = test.size.x
		$GC/VB/HSlider2.value = test.buffer_size
	
	if get_tree():
		await get_tree().create_timer(0.2).timeout
	
	$GC/VB/H/Button.disabled = false

func _on_CheckBox_toggled(button_pressed: bool) -> void:
	var cfg = DebugDraw2D.get_graph(&"FPS")
	if cfg:
		cfg.enabled = button_pressed

func _on_FPSMS_toggled(button_pressed: bool) -> void:
	var cfg = DebugDraw2D.get_graph(&"FPS")
	if cfg:
		cfg.frame_time_mode = button_pressed

func _on_HSlider_value_changed(value: float) -> void:
	get_parent().graph_size = Vector2i(int(value), get_parent().graph_size.y)

func _on_HSlider2_value_changed(value: float) -> void:
	get_parent().graph_buffer_size = int(value)

func _on_Button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", switch_to_scene)
    PackedScene    �      	         names "   �      DebugDrawDemoScene    process_priority    script    custom_font    start_culling_distance    text_groups_position    text_groups_default_font_size    text_groups_title_font_size    text_groups_text_font_size    graph_text_precision    Node3D    Camera 
   transform 
   cull_mask    current    fov    near    far 	   Camera3D    Panel    visible    custom_minimum_size    anchors_preset    anchor_top    anchor_bottom    offset_top    offset_right    grow_vertical    PanelContainer    ViewportContainer    layout_mode    SubViewportContainer 	   Viewport    handle_input_locally    size    render_target_update_mode    SubViewport    CameraLayer2_5    Zones    Spheres    Path    Boxes    Misc 
   Cylinders    Lines    LinePathAnim 
   root_node 	   autoplay 
   libraries    AnimationPlayer 	   LinePath    Spatial 	   Spatial2 	   Spatial3 	   Spatial4 	   Spatial5 	   Spatial6 	   Spatial7 
   Cylinder1 
   Cylinder2    SphereTransform    SphereHDTransform    SpherePosition    Box1    Box2    Box3    BoxOutOfDistanceCulling    AABB    a    b    AABB_fixed 
   Billboard    Arrow 	   Position    GizmoNormal    GizmoTransform    GizmoOneColor    Grids    GridCentered    rotation_edit_mode    Subdivision    Grid    1    2    3    4    5    6    Target    HitTest    StaticBody    StaticBody3D    CollisionShape    shape    CollisionShape3D 
   CSGSphere    radius    radial_segments    rings 	   material    CSGSphere3D    RayEmitter    RayCast    target_position 
   RayCast3D 	   RayCast2 	   RayCast3 	   RayCast4 	   RayCast5 	   RayCast6    playback_process_mode    LagTest 	   CSGBox3D    RESET    CustomCanvas    anchor_left    anchor_right    offset_left    offset_bottom    grow_horizontal    mouse_filter    Control 	   Settings    theme    switch_to_scene    GC    columns    GridContainer    Label    size_flags_horizontal    size_flags_vertical    text    horizontal_alignment    metadata/_edit_use_anchors_    VB    VBoxContainer    H    HBoxContainer    FPSEnabled    button_pressed 	   CheckBox    Button    FPSMS    HSlider 
   min_value 
   max_value    value 	   HSlider2    _on_CheckBox_toggled    toggled    _on_Button_pressed    pressed    _on_FPSMS_toggled    _on_HSlider_value_changed    value_changed    _on_HSlider2_value_changed    	   variants    h                                 \B                             �?            St?>К>    >К�St?d;�ffXA
�B         33B   �Q(@     pB       
     �C  �C     �?     ��     �C       -   ,  ,       �?            ?�>��p?    ��p�?�>d;�`�B�`A     RB   �A            
��@            U�A�G�!X%?����   �r�@            -	�@            �@c`=>>˿?r���    � A            ���@            ��AA&]�W�S����@   �q�@            ".@            hy�@!�W�W�S�G�@   ^�A            $�@            P��@+v��t����'��   c+A            ��~@            ��@M*A��?3���                	   New Anim                            �?              �?              �?    �+@   �     �?              �?              �?   @  �?  �?     �?              �?              �?H��>      @@     �?              �?              �?-%�    _��?     �?              �?              �?   �  ��  �?     �?              �?              �?      ��  ��     �?              �?              �?  �?           w�?��Z>��ȴ�?�)Ѿ��m?v�f>$
����0��    A}��     �?              �?              �?o�����A}��   �&A@            $	r?��"�    zǅ?2�@��h���*>���   ��?�H�?����H�=�2O?��@`�)�M�?�#����h���*>�^&�     �?              �?              �?�(*� ?���   �9@�'
�����;cb{@�g<�j?����E�?�`�    ��2@     �?              �?              �?��f�    ���@     �?              �?              �?q`�    �J(A     �?              �?              �?�t��� �>���   k���ž�u�=*�ƾ%�k?��G��6h� ��wi���7�����c�@     �?�������2 �2  �?! @2 ��      �?��f����}�     �?���� �2* L�  �?! @2! @�      �?�0R?���?�a9@   E�U?    ��      �?    �?    U�U?猆�/����@     �?              �?              �?h�K�Xǩ�-&�@   YM?!����&��
���<�jW����>-u?]���R��̗��-&�@   ��?��?&�?ף���)?%�?    ���":@8/�Xǩ���,@   ܝ�?    ��3�    ��?    ��>    �M@ۿ,�Xǩ�2U�@   �?a?�h~>�eϾv��#/k?��A�~p�>�6�>��d?-����~꾺I�@   +i�>I<*=Y�k?w��=�N~?߻��O@k�3�=dW�>-���m���P @   �5?    5�      �?    5?    �5?߉�@   �wۤ@   �Y�?�I9?�Y߿#���襳�����Y߿�I9?�Y�?u��?������?     �?���� �����*  �? �(����! *  �?��L����4���>     �@     �4      �?     ��      �@                 �?    ����    ��? �7    ���/��?  �?      �?   ��?��?&�?ף���)?%�?    ���":@�#AXǩ�TR%�     �??R�1���2֔|5  �?    �'�� ��  �?'�����x�?     �??R�1���2֔|5  �?    �'�� ��  �?ff����E�&�     �??R�1���2Ր85  �?    q��� ��  �?@��4hо6aV=     �??R�1���2l��4  �?    K�D� ��  �?�˗?��?l��>   ��L��߫�I.�=EG�,�&�^<Y��u�?�3�?�[�>D4�?   ��L��߫�.�=EG�,���^<Y����?���?���?Ƣ�?     �?a�7�\��4��]6  �?    !��� ��  �?��0� �4>*�?     �?              �?              �?`��@l!��NbA                  
                 �?              �?              �?!����@�Q�     �?              �?              �?+k;�    -�P�       -�]�         �?              �?              �?�S/?    {�J�     �?              �?              �?x_5�    �?     �?              �?              �?�_5?    7?   Ify?[g�    [g>Ify?              �?'�    ���   ,�o?<�>    <��,�o?              �?�\�>B�{��X��                           �?              �?              �?�+'A�+��f��      @   @   @                            
                   ��     B     �                     .   res://examples_dd3d/DebugDrawDemoSceneCS.tscn       GDScript example       FPS Graph enabled       Switch to C#       FPS Graph ms or FPS      HB     zD     HC      C      node_count    P         nodes     t  ��������
       ����	                                                    	                         ����                   	      
                                 ����                                                                    ����                    $       ����   !      "      #                    %   ����                  
                           
   &   ����               
   '   ����                    
   (   ����                    
   )   ����                    
   *   ����                    
   +   ����                    
   ,   ����                     1   -   ����   .      /      0                  
   2   ����                    
   3   ����               
   4   ����                     
   5   ����      !              
   6   ����      "              
   7   ����      #              
   8   ����      $              
   9   ����      %               
   :   ����      &               
   ;   ����      '               
   <   ����      (               
   =   ����      )               
   >   ����      *               
   ?   ����      +               
   @   ����      ,               
   A   ����      -               
   B   ����      .               
   C   ����      /              
   D   ����      0              
   E   ����      1               
   F   ����      2               
   *   ����        #       
   G   ����      3       #       
   H   ����      4       #       
   I   ����      5       #       
   J   ����      6       #       
   K   ����      7       #       
   L   ����      8       #       
   M   ����      9       *       
   N   ����      :   O          +       
   P   ����      ;       *       
   Q   ����      <       -       
   P   ����      =               
   ,   ����      >       /       
   R   ����      ?       /       
   S   ����      @       /       
   T   ����      A       /       
   U   ����      B       /       
   V   ����      C       /       
   W   ����      D       /       
   X   ����      E               
   Y   ����      F       7       [   Z   ����        8       ^   \   ����   ]   G       8       d   _   ����   `      a   H   b   I   c   J       7       
   e   ����      K       ;       h   f   ����      L   g   M       ;       h   i   ����      N   g   M       ;       h   j   ����      O   g   M       ;       h   k   ����      P   g   M       ;       h   l   ����      Q   g   M       ;       h   m   ����      R   g   M       7       1   1   ����   /      n      0   S               p   o   ����      T   "   U   c   V       C       1   q   ����   0   W               y   r   ����      X      Y   s      t            u   Z      [      \   v   \   w            x                  y   z   ����
      X         t            w            x      {   ]      ^   |   _       F          }   ����                t            w            ~   X       G       �   �   ����         �   X   �      �   `   �      �   	       G       �   �   ����         �   X       I       �   �   ����             J       �   �   ����         �   X   �   	   �   a       J       �   �   ����         �   b       I       �   �   ����         �   	   �   c       I       �   �   ����         �   d   �   e   �   f       I       �   �   ����         �   d   �   e   �   g             conn_count             conns     #   K   F   �   �              L   F   �   �              M   F   �   �              N   F   �   �              O   F   �   �                    node_paths              editable_instances              version       #      RSRC�RSRC                    PackedScene            ��������                                            	      AABB 	   Settings    GC    VB    H    resource_local_to_scene    resource_name 	   _bundled    script       PackedScene ,   res://examples_dd3d/DebugDrawDemoScene.tscn ���:^      local://PackedScene_oufdb R         PackedScene          
         names "   Q      DebugDrawDemoSceneCS    script    Camera    Panel    ViewportContainer 	   Viewport    CameraLayer2_5    Zones    Spheres    Path    Boxes    Misc 
   Cylinders    Lines    LinePathAnim 	   LinePath    Spatial 	   Spatial2 	   Spatial3 	   Spatial4 	   Spatial5 	   Spatial6 	   Spatial7 
   Cylinder1 
   Cylinder2    SphereTransform    SphereHDTransform    SpherePosition    Box1    Box2    Box3    BoxOutOfDistanceCulling    AABB    a 
   transform    b    AABB_fixed 
   Billboard    Arrow 	   Position    GizmoNormal    GizmoTransform    GizmoOneColor    Grids    GridCentered    Subdivision    Grid    1    2    3    4    5    6    Target    HitTest    StaticBody    CollisionShape 
   CSGSphere    RayEmitter    RayCast 	   RayCast2 	   RayCast3 	   RayCast4 	   RayCast5 	   RayCast6    AnimationPlayer    LagTest    RESET    CustomCanvas 	   Settings    switch_to_scene    GC    Label    text    VB    H    FPSEnabled    Button    FPSMS    HSlider 	   HSlider2    	   variants                             �?�������2 �2  �?! @2! @�      �?��f����}�   ,   res://examples_dd3d/DebugDrawDemoScene.tscn       C# example       Switch to GDScript       node_count             nodes     -   �����������    ����                @    ���!  ����   "                  ���E X ����   F            @    ���H  ����   I            @    ���M  ����   I                conn_count              conns               node_paths                                                     editable_instances              base_scene              version             RSRC��D��extends Node


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_F3:
				var n = Control.new()
				get_tree().root.add_child(n)
				DebugDraw3D.draw_aabb_ab(Vector3.ZERO, Vector3.ONE, Color.RED, 5.0)
				get_tree().create_timer(2).timeout.connect(func(): n.queue_free())
				
			if event.keycode == KEY_F4:
				get_tree().unload_current_scene()
				
			if event.keycode == KEY_F5:
				get_tree().change_scene_to_file("res://examples_dd3d/DebugDrawDemoScene.tscn")
�H�V�Ne��N��^RSCC      �   l  &	  �  ^  �	  
  ]    %  �
  >
  	  K	  
  �
  
  �
  �
  �
  �
  D	  i	  B
  �
  �
  %
  �  �  '  R  �  �  �  L  }  Z  n  �  �	  �  �  (�/�` �X �t&N0֪Ic������W�ڛX~��6�5���8|d.��q���ߴ�����D���4$�֖zJ+'��.J"�zE#dK�-nCN���ӯK�h8ר5�C�p
k�g|�#_c���F�9���@f�CW��8�B��[�OJ%2��hz'"Y>~&�G��$�s�Na���υ��D���%�o���p�²�2R�3�q����w��������WWD~&�o��Pg^	P�v�$��õ��]�	$�
$h*�������H��x�/��2��A��y�������8=[&�0��"�*��Q�%��xe���M`!h�2%��oyѳ�QU�R��)=��U�P��BP}���(�')��2"���W�i�qa~c�ܚ���:`I4������`��)uWB�=�h�zX43'�595R4�
�p@!�=3��y�[f����%���AS���r@����t@\V�S�yU��?�����o&K�3�n�o��g�|?R������x� �����������	�p>�0%��n����LapL����6'��/=�f��r;Sgu3�N��n9��E���^wU�;,�o@ϧꂾ�mgn�~^���*�&Px�Egj��܍���.���p:a��8���~:���f�����r&׫��3���'��p�ow3K �/h~��/n�tQ/���_��mn��޳L�vp��ڡ���C���ku�*�!���Ʃ�l�&��l��|��v��V���-Pr�{����+c�U�ߌ�yJ����+��	4k%
f7T� ��Q�JV�ل^��
w��.a��A]�|�BN���r��5����kj��4��g���ơږQ��fmw-�㬕�����gT����M�-݋�ZL��h� Fs*է�5Q�b��;��(�	�\ŚߡN��"��,;�eF�L�̺��)�ٍx娑�3�[&+�Kc�d�M-�a���k�S-`;T�#u�}2ъ�M��D�������I���e;��&���ˬD}Gmg�D��`���I�SWY�õʹ����OV�$P�sD�͈4>B�����d@K�b�6�|��I��t5��ң^9M^BN��T;��.��u����T.�p/;�k��WVR�#Ur/�=���[�k��D&�#�l�W�ks��-�Q흿���fq��2W��Xّ�,� �K��,e2�Եz{��寭��֖C)��B��Q�6�*��@6m
FZ��c�Ԕ)RЦr���|D%��`uzg�M�<F3Z}�b�J�ͱ��`��2�zHs�kB�k�U� ����R��qj(�7Qjd�ɐ�Gv52�rD�H�ר��D>/�����"��c��c�E�J��c��gF0/��qT��Ԩ�l�CU���3kA2�������m�
����QF-1
��N�U�9أ���yD�,�R�>�8��=���S�6R�����,��N��Ƙ�z5��-�V@e���fj� �ƲGSU�}T.���U�]o�� }��k#�c�<�`�g��R�Ƣ"09����$۵��fA4���=����H����{���3���V��0�핥6�]����Cچ6Z卑�V�g*�KN��yƬ�Q`�Ty{1��1�I>fm�bc��$g��3j���ٵ��Fk�X �	��c6�eF&���Z;��Q�L�� �oƪ{�[�>}DU���������n�P�lĨcշq����t�o��\��ʵ�z�ňc#�	̸�C�9NŚht�Qiu���`���ء�H�U3�k��c�����Y3,Kդ�j��R�2,�9l��OkQ��E3�e��ڦ�Lαb�Z!P�����Uv�*zN*��IE�LEe8�蕕8q�@85X*��!+��Dv�E��2�!^yH��Ѷ�}l}�Y%s�Og�Ok�OG�o9k�%��}
�@h���9�P@A�Z)���V�_���D�]���ߌZ$S�{u�e��1��z�p�ڪ�Ԫ�Ԯ���9�j0�� �Ѩ�(�bTj1�5�P'�h&�Ѓ��k=O���5�sm�v�b�ڮ�]�Nֳbg�-OB��	��}��A�Q�Q���è�ati�Z�d&����,ف��g�2����sœ�󤲵i#�j�Q-�a��b�q�%bg2�-'��I���Y���	[�"����-Gb��d���:���{��S˹�96��h�v��d>�d7���Զ-�O�#ֶ�|q��X{Ny��E��?��J[	�<��2���X�gk[�d�<k��di?�g�s�*=V�s{�Q��@꼴F^ڦ�6䥝��N��R�Q5��"��-�a�if� Ƥ�*�LZ�-:�&��
ُL�rh��P����7v�tּ�%�B�|��k1�G�jgj��l��g�zЈ�i�3 U8��u���Y��� ۩OcU۰KY��,�o,Fc��S��9���ѐ2
b�!""%""5u@�U�����jA�=�kI��W�<t.��0�E�@�K�\�Zr_$��MT4��.!\��B����?��="���*���E���F����1u.X�\۷�+�n�3���Cj!'�A�uʥs��m9���L+EK,�3l��o��&c�~Xܯ�T?Mw�&p����^9�? �-����f��o��9Q�^NǠ%�`"�G56�2���->���N;�Nߓ�׍�J,6�<ɂ,��f���X���ܸp��Ɓ�O�3�?Eq4 8-�q��]��ej���~�t�΀�S$�=|g1^�+6<� �cN���X�@J/��&,�\�Pz���P3��1��|W��$o�(�/�` ; ]X=plI:Q��j&[�%p�=+)o��"�Y�u=;ϭ�C }�}U�u1�@����P�����ܒ�'� X�L�-�K�x=~)�	����l�T�F����J���6L�Kw�ax��Zñ���Hzݶn[3նfնNΰ��	��Ս�x�&V��\�J�m�T���m�T�rݐ���Z�X��(���/n�u�3�G(�C1�	�+1�+j���W]����샧exq4~J�;ڎ�ҺXC�Ax��rMj\9Վ�1�"x��&������X��L)߭<��n������Ss��6KͭY���/!��a�G�c��x�K`�s�:	��jy�q ����*5�WjnŞ[05�Y<��zQ-��=M����t�^�H�֛*��vQѶ���#��-Zo��js8;�Z�<��>�o��1���N�"N�]��iuLu�{���S[�E������� ��Q�{E�u4V��)nE� �nG�b>�G%�S���c�G�i�xNr'�;���øŋ|�ʉs�o�.h>]}���B��$��X����J����-���i�!M�%�V�[�՟����Ə��خSm�'`�[H�C�^���O{�/_���������+�=��d�8��j�R�b wb%���װ��౛-��q���3�)6w�0<8��a� H���	�H[�K�yw��d���;l�t�	�Φs��'�����Ϟ4�aX� {R�i���=A� �IiH礵ڤ�NJ'm��r��[��)�aOٽsΞ2��Y��)�ln�͔���S��np{�[2K�='س��s�	rw�l)�6K�M�-w�g�P@�����Lñ�j���h��g-�ܬ�D��`�\OtV���spY�	�\����3�ǻ��!n�K»��)�J�^T��Io�?��8/s2��,k�Tk�5�����0����������p6��-FՄ�U�*UQU]�Fl#��D1"���%^�D����@ĉ7QJ|��P4A��v�t;r�p�nQ-���Ċ���p>�a������L�� 	H��y$iFj�P�9&H����L[D�g﬛e�vj�7�3�i��|M>"ߐ�����*|>��g�z�tF�s;�s2/{�9���σ����?6��<��{�n
����T빲��<�l^f�-eoo�s[.�])���r73���Y��d����H�FA���B�1��)Š� v�C#C"3��$EI�1�(D��I�a�8Rv����lVV&������F��V�~�W�&��(A$ �yP��j���x�(<��1n�''�����ֱ��!��uN�8VԨ�5>ꆕP�\C��\��������}b��\��f�!��`q���R���c@�"0���?Z$:���b�(ZG��He���b"���=6O���(� ccSC���z�f�����)�HT�Ճ��;��Ib�!��¡#���E��:�X�(���@�A�PɆ�P6��O�JQ&����B-�_�M2�T8_Ֆ�hgΡ4\q��?,���
��4A��c��Q'��9����S����9���v�?鹺]Vw��ߪ�G�u�^�����M��k�c���kH�����!��_��(�c۩�6��<���ݠ�Lz��l�k��r��rp�WC��[�Vை�q'�F�Z�{���sP�3|vXh��um���	�K��4lcO >Ӄ�WsO��8�G������Obh��|nv\r~;�<π{"ڄ�S6y^�l���g���|�񴹯�4ZT���ط�?�<��2ҍm[/�!�[�1�:��#hg D�W����sG8��f�v�7�����Kc��V��9Ix-�v�3"~鬬9+�C�hHv�<��Χ���׉n�Y<8JWe�S<��^N(�/�` �H ګ�A X�Bc0# <d�)���Cphb�Q��tɴk���0
M'o��_7-�����6/Z%���0�P"��)'��[d��kP閟�SvJN�)����̔��RZ�JI)�H/g��RR�e���G<%��r���Y�I�,K8i�Y��t�m�M�喵|&�,�$Y&��5��b2L�I,_�+��+��Kn���+�䕼J+i�{Q>�/��'�L������� _>�_�	��U�	>���q@�'� %Eg�##jI�zPۢ�FL-L���15"kP־԰ֶָ�����$�]Z{Nko����HJؚ�Dl=����M؂`��J۔�I���!iK��Q����:v�c�\oO��Ѽ���7{{;o?�-�������vq����8&����)�K�ˁC�p��Ǆ��B��v �ص��7�?ß�o?>�A�g���vn��w���.G�qCL�t�PŤ���U�*U4�dT��ʪ%TP����2�j�*G��꼲��yi��{�<����x:�{6�ԛ�ޏ��t�tb:+:t�h�2綏6m�5۱۬��Nֆ-�#��ݱo"=��Ԏ�i�R/��X�Ce�U];eZ�?��J2H�HQ�	�P�p�pd�I���X�~.p���P?�,����oє��$�����~G?��F���ʟ�+�����~)9ů%�����[�����M�<��J��m���h�"R����*@n�#�`8Ċ�.��W�
�`�
�h�f�K0�E`���}������n����,`���+`D�G�A0t�O�I�,�%�(��nY-�I9iK�nRM�e����I1iH��e��� %���=�t y�%���������@-4�� ��t�R���)ԐRB�8H�PI*HAHݎB����;��M�QMg�}�Җ�4���U��P�ͣx�	E�;��8jG���W\G��Ѵ稢�h��i����ʹL�(�R�E����&��:�Q�?+�~V�Kh��h�F��)��Q;�	u�2JF�<F�,F�F���_�q�R.��f�m�f���%��2t ��R*�F�h�,Y%���P:C����p���RTB��������
���Q;����=�c�ϱU�	�7��8�cؿ⿱o����џگ�4��茕�/G�oS��4�~?���d�����x�ߨ�#:��(�G�D�H�P!}A���@�Q R}=y��h�}�;v���u���M��wb5K�+�O�4h��,vF_�a`�f��F��>�8����/F�~�����E�Kߋ�r��҇�-�EKs�}6��[���5w�F�i�b�K5E�[I��?H� ���ȗ�? �F~��[��ϒ���&�2�d�c����܅�-|0[���>�|�s�����4�3��˟?	�׏�~�|#�(�s�'����)���~�?��"�|!�^� R~�#��>�)� ��;��������e�Qr��|xi�sT��z4��ޟy_�}���6���1�ռ�J�4�à�{0���y�H5x��>�Bｼ��~�����Z[��+|�O��z?�=|�����Y���ޓ��w�='���7�^L�T�gѽݯ�w�{t�Hu���O�F�,��3�}�^��ܹ�~��|�}Q[�ڗ����mMm�����]��}P������_h?|A������٧��g�>���o�v�Ͷl�>'}�}"���k��&�������������e�k�k��#��h�����ײeߒBٿ�E��?ľ|!����B��}'�R�M�mؿ�a |�gX�'i��}%���]�_��R$xd_
5�/I��
�#����!,������`9��3����稑*0�
�(��$I2��$""E �{
�B��gg���CG
�3��^�dN�[az�"�A�����bI�����'~�˿n\����/?nr̪��73��o9�����C�[�х�1��њ�'_kn˨�/��f�#���j�`�+o�<�pHw��X�:3�Z�yS\����>�>��O������E�;|�q;��/���ԓ�5x���W��-A�MS�a���+�t���b��ē��Zӏ��։����4�N�����������_�A�������9l�j�y/�8ua�:�T���q��f��5�����L��ѯ����
�9D�<��K6�k�4ߣ�s�r�?�$��EOz�x0��.����A�ȟ���0�^އ~��C:f���UF[8L���C00���b�5(�/�` -u ��8A�� �l���_��eJ  �G�c+�Q/0��wh�h��:�z�}�Ny��8q��jI̐�hie
3���A�0�b���l}a�Z���������q�h��>�Y�i5P�	@
�|H�D}�X%��@L���=C=sH xS٨��S�)�����k)Y�D�%� ��9��3�ù�c���x ǁ�:o:f:G:�H���ps6q����Hq��X�8��`c�=G�wѩ(�fHMQ��Mh(��:��Ot4]J�ѿ<�TO,yS������O����f�Q�_����F�lОg��<V�~�g�wu����i<��O�Hy��Η������������f8���%��W�6�bⲼ�#633�	:c�M�J#������=�f�t�8F.����]\���/��舿��dq��9����p��nx�Y.��HIC4gZ�i�D�uF�e*!CT�^���O-E6��)��EϜ\�E���[pS�~�����7�xjO�с��]�/�v���0���}C����C�)vU���t��W���[ov7�ٷ`,���~���n�m����Z�֊����گՍ�+��O9��xc�vͺ�vc�j����[��/�;%�ٍ��5��k;����x�Z�w�����O��{c���Z���ʈfߚ��X��F]�kP�e�SX�O;����/��W.x-��{%ݿN��F]׾�֮kW��{%��QW#}�b����o���{���v�K�	7������@�<���٩�~���͜�o��?9?��ϗ�C9�s��P�������k�k������)��_��+yW��.�ʋ���(���?�������f��r���k��t�3�?%����ka�����z?����g��Pr�\� �U;+uXu� ���=��е������T�Q�A�H*J�<�9�7Wcn��)XSv�J�!�IJ:� Q���A�B���DH.̓�'EO�N��d6��/NG�	&�p'��!.I[2��gI�&%�I|$�Ir�V�&	H��!<�v��F��0��d��"
���@ds���!��wcsۺ����&ȓ bAh#�i��f�
�.�.�-�ǔ#~X ������Z��k�=�z��!�c�ڞ�5j�<�x� ܁b�+p0�f4tС$���86�ػ��F��-W6�l��(�6N�KsK�Jk��V�Y#�F5h���F[D�CcC+C�Aϰ��# K�� W�e��a�,���01����q���̒L�l��,Y�"0v��c1cwc8���V�y��]��Ų�щ�)���I���ËKm.��"@[�hA��-&+0����TqV�E�S*.�p����3",050`c`A`�R���|E}����j{����k��]'�'����]Ѯ0W	.+�.�.#.ɭ[%����L�0�@���U%дRhUiU���J�2ʲ[ ����"���*#�F, M�;T�=,#����@,Z`�X�U����A���C�'�:������� �)�)�)�[j�T�2�p��쨸�Qy^/o�װ�Սv}l� ��L��PmPSPS�)O^Oէ�a�8�9ip�:�@��&Mqf�0Xa�b�\J[jZR�B�.��g�k!�$E�I)L�#T�Bጂ�	<&4�0N�&�$A"�@#y9�;r�����(�H͝��q��q��H�"�,	$D%��2n����#+#xQ�"�"1"x�l"d� ����^0�Ԇ�	 tÁ��+m��.�!۔-�N�4�-�6�	lV�-_ɮ	�u9�	��� lA��{	ۍ����>c�`s�C���Il+[ʆ�X�וk�:q�e�>��6`M��k�a�]o�>�uͺS��ڋz�VT��Y�p��4���K=�NR[�<j]r��iR
$��d�`�Y� �  u�/��G�G�ޣ�1�c�G���I�D��ǜG��3-&O����9}�L���J�C�?�:�.�Zi�4U:C�Bz�qw�stsDs\��x���vD'�����VC����_tt݄��6B;@3@��u�Pt�1���˹}<���N�E�k�3��Ĺ�|�=+8�Y�QHcZ��F�Q�L����FN�.�gF2c��	�F3�/�+�(F.#��fK3�Y�<g�3�0�����$��|c�h�h���a����b�E}�"[�b�bWq��U�QL Q2�1qKb�D$�9[$r%J%&%Z��g1ˈy�Q� �(��E�BDB�A����9L;;�:\:���1|6��^0Tn)�+LR�VHV�U�-�Pؠ0��!&a��LHxG��p���(G>F T@HC�99�88�t�16b�i0� u�3ς��{�s�n�;g�z�$D �,s)'�����������ge��T��S��aׁ��|�T��l("�)phx ��܅�H�#G!!� ��O����Yr���-���~c)�"c�ccc�1���fL��o���/��_�_�?�"�U�t�&�����~o~j~g~\~X~M~D~��~`��}�*}H�������������v�������|Y�����������aٻ��禷���gA���!��(<A-~Z�Z�Yβ�d������+HW�+uwSwPwJw���ܑs3���ub%���ab&1:�n
�N�;V�X��d����.`��4l�J���w�SU'l���_��o�٥A�u����>譿�(��?��_虢sM虢���on�N>a��i&L�z�td�٥�n����D��8O1W��l�K��u����C�k��l��OBǈ6���F���`�)0x�B�C$W�0����$�Iұ�6G:��n�<�
����5�0�I'l���_��`���r�������.��Kԩ�*n����������������s�� �)��g3Q9v3f�yg��䢓�ujv*>��@бy����<���)�t��٥�}�:���u�Oqg_�N�i#^�N�/Q���/Q�����N:�r�z;U�a+���������|���@�������6�6�6lV7u6s��[3R�Q����Y��D��&�&M0�,�+M0_޾�|1O �%�%w�'��q�x�8\�HH\F�+��w�w�Mq��O�'��9�b�p�Ά��p@��^��~ �.����S�3�'���p�'�	�t��ˌ���	$3G�Y&�̭��L��L�L���7o/��[�M~�o���{�{�������Vz��o0-11Řo�90Y`^a2af1q0�\�//�.��)�q�G.�\�]޸���e���%^�x����%��S���.'��\ʸ��+ݎ�Bw�;��F��sW�p����Q7�eKEK-�q�=,�,�,��I�W�K�*�T�++�*�T�U�UZU.UUB+�P:R�QF�l��A�E)E�DD��2J�9�99y8�,2ic2l�j��$v�fɵd��X2N�d�3��P�D�TɗČd�̋t�9)"�)r(�'�L��M����y���+�&�"��v�6Q�]��d�ُD�AD�������(�0)n :�J�~�@�<B�((PK:	 �
��-��w�\%�F^ªUJK�9���JB��@��DL�wf
#��������NM�B��G(�/�` �Z j�x%L P;�:��ژ�d�*x~K�Wr�������O���1�K����
((p8���E������C +�dk��"Vｷ�)N<@�P2�p�����"�Y�r�e�燐�<B=9U�ape�Ieo]}ɨ�� .��$F��e�v�%����:�
[���:g �MJ:��#^t(g�D���ٷ�ЭB)������D�p,+_�D�#�"K�J�J+�J�L�*a�@`Z����\��X��R�v��Ԩ��Ų��jDP���f�
ێ�K�?���dRy���('�����G���g,]����B�I;�4t٬��m���H���P���]�6���j���[V1�o?�TN���I��q���7� y������������e��$�	�@����>��j��a���;��7]��9!�E��~�m\��Iqƥ�0+�H�o���J����M���D�����2�TR%Q��X�r�!����������â�����"��튆x�
ۡR�+l���۵L�hn³�K�'��;���B�>�����٘~̖����q������CYg�ܲ�d����/��5`b���2#�Ib���o,:��4��	�i�H;yN$����v������"$�3�*ҫ�Jm�����Q����h��K]WG��Xs�p� p��e�� L����m��?z��z5;���X��X��CH������\�4��%�ܭP=���؉��7�uY���$�/�/����K��P��Q�sT@>1h,v])���g����3����.^���B,X3������ݮ��G�%���l���I����y�����m�v�g烽�C_��{���Gɒ3�v�?!��)U]�R����n[dT�{E������Q>}��>���{��`۰��7�wìU��V�]�Fn�bqf�>�����3L0��oR��-wi3�%����}ߛo�(��/���K�P��%��J�N�p�R��u�-:\�k�
� �*lZ�P��O:�	?��J�ֱ�0q�2H�	,_2�j��x��f�=�Rj���D=0s��3�' -fU�g[�"\�x.?���rb��`9A�%iRG�A��a5���ZT�z��e}�4T1��Ӥp�M��9���1������j�o�Qw��0��NCVMF�,ǐ����Je�1��l*G��P�$ps���D�˸��2�� �������$���68^d���8�0��"]u��@��wǂ$��/pYeIͽ�����ѫ����a+���@i�#4��	�`��3��̰���a������7&r�oU���G��������MA__�=�|u8с�&���=�8�%�iT	��6������n� >�̤b��1\d��G��@<H�G�<�0W���+8��R}?����߰�3�D���e����er��W��\a�������K�"\�,иg��1>"�&�A�lvO���3�{��sp;L4y��R�߇W%z�F�}�T5v�Gu��H^�:݁�/�x��QB�?nIt	 q�#�Z֗��2����x1>�]���&?��O�;L඙`abe[�<�H�|r"����o,:��0I(�~R.[��l�n��zf����m��pmg�����&�'o��}a�]a+Lr�mR  ��N��R$�T��_6y�������(Fz��"f�۠�2[�z��<���||�h���KrY��Wէ�*�����չ��wYɕܝ+lw¥��� �-�B�a�4慊��b6�f$T2���b�ov[4u�]a��E�
۴�U�av�SEzerۣv5���m�v&i��I��L7����*���Z��z��
O��4��b�p�8p�h�#G�7{ Y�e�A�:ih|yp"����.,]_j_2l�h�Ǝ�?r���lܥ��U_夤�uU��:�����HH��L�]W%K�L�i"�X6���Ȱ�!�������J�3Ů���pY�'��1�;�ȩ;�eW�n��3�v�.�g!�(���dG�~v
b����U��}�w��+�U����)��wc��d]}d�乔��d~m3��4�$��#��������(C߾г�?��I�.�!Ab���z${�=ƆþE�=�7����a��J^E��]���<W��i�gM��5'��c~Z&���_���ND��EV�sY�R�iLގ��\a�s�4|"_��?KK�8<q����2�\���q�����c<�)Y�G��2H#1h/�6���t�(R�,��<�qa��fX��]�w�ibM1%Ty̟|��b����)�����6�)��&�z2e�����ޮ�#�+l}Q�%����]�M�����6(= �(Zb�
���̭�ب� ǜ3FDDDFD4I�`��2P-S
!I���	�r|���Y��PG��:w�7#`��A}:ۄ^��h$(��-�7�p~'��M�E��=\(�!��n���	�z4F>�lw��	�@�Ts���y6��\!��m"$r��>k�s�n������U�F�ᢸ'�v4E��[z�u�=G\)ԃ��*��.�S�����Fѓ�B�a��Z���L��Ԍ�p����]�2I�������Q$��z�2������]����K �~l��Dߦ��Dft���鄐���(���<j����FP�c^���c[a+�ĵ�l�q�H>+��a��(;�@�����Ƽ
�^L�%�{��NM��Ի��t���ր(��{�1������Kv%�qyH��<wӗ!�K�u0�O��w���4���C5q^��=D�8�DI6D%��$VQ��S�����1�+J.���NkM�x�$!����WHS�F/SQ��=(�/�` �L �,N �2�2�Cnx�EA�o���������K�M���16%݄y� �N`�;�|,<��u�#�e�^(Fi��Vڶ��2����BV�,s�"r����C�R�1�G�)L����=\]��g?�gg�d$����+D�������Ĕ�oþ_P����0Q�6�*�������K��V]�`.������.y�����,���4�q��w K%c�kP�_�ꃡ`W�BDB!v� G�:׀ݯx��^}tF�_s��^;�A?t����MY~Z�o,���U�i<�bK%cg�A���5�^*Bx�XO�p�8<�6����n��_?@�>�d�l13��D��1&�Q�e�a���W��	�i�jp�O�O7r��}M�Za����)�t�$���Ė?b�[��~b[�C��2�x�0��m�m�8����S��k�A$�IXx>3 �0������1�!��<��T���n�4�POL�_����yPOLMAf	25=񞠎�D�hH�����	���6⪲�`,�y�T{�?�SK��=�Ǣ!�4}h�<�d�~��ie�Z��^/�*�t�����;�mu��Ur�^�.=r�i����45U��p�5��v3jQLة"C�	�2'V��AA�i�H�&�5�Q+���fJ���b��|~�C���~�
ܜ�#&B�EC"6��š�� ֳ��n'<Y�
٪F�V]��p�K�;!�[����;���W��l�@M��ҸX-W����ت���;�U��X�/���8��)�֣�Y�}ui\Z9e1�uߴM�����y�몫ˡ#�KՙX7����:;� ��¿���؈��輲�4�¸�)����7ꉩ	-m��~?f�ٽ��\g!�k`%�2$F�Y�m�@�è�ʣ�;v>�����f.Zt�-��Iz/�����56��}?�Q
t�#�D��o,��� �g�y��`@�ԕkP-ukPե𯬆��|���Eɿ�\�v�ߟP@�ɭD��}��0$t����'S��|��/KB_�En3'��S�?kP�	�g@(�B���B >�\�l7hN�,�F6�����yZ��\��)�筈xc�|�>��K9���7��
��q��"�t^k���I�P��}�n�{�4�.ro}�td�2�=uW�~������G����3���Nv����p�XT����5l�5�τ��ZaH��c��?���cXcg��"C=9�x����X�'־�܁��1�C~�Wn���)i$u��lS*��e�"�0�����kPͺܳ:�:/��0�j/�/ϣ.Bmk˹�C>l.��|�)�{��.�X�ٰ�����~��l�$�ܭ72}�g�YI,	����:�*D�1�w�Z�g�Y����P6���To(~���;���'E���i2�˙Թ�	h�{'�)���^�=-%�5?����&�籿|I�M(��r=��ik/r��1����傞�����춠V��_zL�h˸��6��e�����)ϛ�����R?�=��z��n�h�:k���l��oحs��?l[�|����6�f+���h6?���.�M�饉mkP������|�tfJ�)y��a��ynP�����	�][���^/���c3�� c�;�G؂�������d���7����:;��P�K֌$���3��
H�[([��D�v��`��)����}(fc�Ჵ&����P��gp�F�N�)֧����I����)b],��E:���"Ǫ���m`$��*�e���ʶ
hFl&��dEA��
rk�CfL�O �ac9)��R_z<*10��3��#������x�Tt��Ƣ�zi"��rC��T�V$�؁ �� S
�$mp�)��4�b#%IAA
��Vȸ�D���R�M�R�����d��\�I�k�4ޮ̖�<���[#C�jCdsr���� x8�wL;�iD���x�F�Љ`�w�4+��,�*�C�Q���Chx*+�k��K��M�xy�Q�-4!<8�7��8z�+ku:B���(�I!D��zK�{_��c K1�!��X�@��
[]���$����[bӾ��-��Ա�V��nO�B��_nن����d{�\2��|
��Ml՟cEq�<��y~���M�2-��Q��t(�)�D��m�[�r?�c�J-M`�i�����f�^�����v�x���p��OG�"�E��Fp>���&0g���Q����2}o��	Di���]OA�?!�h��a����� "�I"�Oo G���;�C\ǝ���IG����v$�h$1�.��!�#�]�����8 �����=	��U ރXXD�&�)J�¥HE(�4_0�A�L�p�|�Cyr��
����o2��&^D-=.�ǻ�����g�S:!�!�`|����%*�(�/�` %P ��K �Q�O������Qo
R�(�w�'Ra�}�ؗ�������Ä�-}�����kU�Lj�߶�4�>��Wn�R����!zIe�/v՞aZ��|Z���vj�$�_�_Mz
����j����(��+����g�i��$KwmKm$4S�][�mi��9��c�*��1�2(S7p� ���	�B#�ⳋ�bC�`(�8�� � x'��j�4�H�M����$G��)��ᇦV������?=4���j?= ����.����@�/wÕ��۱p���?�3k�V���do�=U���.o�r��
��j��Q���ں6fwm�6������}8Q.3U��cw�W�x�����{��q�m�b��{��^+�����8q��OU0��%y�#/�7��Gw�a�Q|��n1������@������y�!)D�������xFwmGm$t�Bd(k��K�d��S1:��]� ��_8��cQv�ە�����k䳣�tO���-֮�)�x!��߽M�|��`ݳ�BRX�bc�J��ũ�8耆	�O�(5�%��7\��z���LQ6�@�s�ѵ��<yJ�=
��<���CS�@�yQ�N�o��-�R�f	-0Ҩ"��Q��b�ȸ%؄	����h�.�Rz@߯�á=�n8�C�>_�Z�k{j#aj��V/O�VJa�MNT�* �KMv�RB��6co��� �&a>&�����`�N\`�R3����^����Uy�R��4�����2]�����t��v����.����D�6�͇,}�~���P��iN�}d����)�s��
T�N *�{0�,��
P��/�	 �`u���H!���C�̢,���d��*sYcږڇY��m��>q���h�.�>�xi*rB� Og�_�P���JKP&H�s6��
3v�mƕ5P{����k)-Ǫ����~��p��v5���b�k|�=
2Y�ڲ��0��k�ѣ�qN����B�.��%��2$��mvFʀck�
��U�H��jr���;�Fc��]|9�P������u�Ն�B��/'�d��P&�LI���Ĩ*baH��3PTiYy�E՚���g2�-rԉr��周Td��w�(i��#�+֔)��
P��A��L��9��R��n��(����L��+M�V��k��3wmg+wmW��{8Q�Rzi��ûc���C�����"6��Dl3oe3y��Dǳ�����J�r���.��B7��
����A��"�b�-u�԰DEA�+24a�����j?�W����6ծ[�Q,�����.�<�C;L{Q���""<��d8222�d;����s�2��e�/=|��>Wgl�&�0]龻e�*�#$!�qik�bdj!	��&�<*-<��(�� ����qOLb�k�"ݵ%������;�?��Xvg�w �L�O|�Ҫ��ГV��S�x�:J!쾎��	@��g����T{Κ5nPm�_��{���q�퐣�a/�u��4�;5u�`�������]�Ge�>���y;��w���ҁr�������Jf�D)p*N��ƾ}����h��2��R�E{^E~:P�e�"�λi ����ʇ�D7r�"$0�pW��gG� $��zt W�P����̚�/�ʭ����y�EH.�����	Lp$31E�����A9<��9$���y%I��dكІ��M��7L�<��Ԟ�4l`�U����_.G���ZJci5 ���y;�{�?�!M��sO��r�V�˭/��8Q�b�*���� q��8����S�G������v�֋���巁6X�RELt���st���E���0��엑FL��޳%4j�*Q�������aN���dKn&26�U������l:3��JR��f�v̟�PȤcHVӝ�e�f����1'�C��]��0c������!%S�Q�$i!��d%�`���U�Z(�c�BP�R�R���"�������'��B�Өέ�'�o0A��ϰR�01�H�wb��@����mh?�v��z��uy�o�l����CAˈ����1���4$��=�#��A�#����N������8(�sj�D�Y(K�e*zH7��� n�ls��(��-�DD�WF��d��t%�f�Q[�A4F4�A��d���lMwX�/�m�D�4�sgr(};7��M�Beh��V�Fa_�>�t� � i�rx�G����e� g�N��3V���D������W4�ج,���k��q���a��p�C������O�%�:?���n��g��M�	U2�K~0�9w���huXT��-y�Q�`���� �T��ᲈS���s��ys9d�����~2޻��/ t�2�/./�r���g�dش�"�w
�s����H쾪e��P���Jl��X��E���[�R���#;��96s���T�h����bX���@Z��y��|����� �Ƶ��w�8�oS�TjKy$�I�(�/�` �Z :�4%N �2��/�;⎫�Z�s��w�7���2��)�5m_!��sO�"!v�7�H��l���G�������݌�Y"B�L)-DR��jw{�-o����"��э\;��cO��ed�ş79�2S?�Y�WU1�L��jP�@#�Ɨ7*�.�x���Gd�C�B"1(Dw_�Z򶊴�����U��~��^�6����<��*�Oވ31.�PG� �Lr����?|!W(�I�f棭a!f�ic����y����%���KL�n�������|7��6{[R:a�s(X��qPC���qB+%ַ�\�>��P���[A| q���',��2�����u���X,�\�&��b��f��b����x�t�KQԗD�n��
[���+:_�F(��f�J,�`��.P	�X,�FPYށ	ѹx�� �e8�[��ݕ�ӳ�|�tO�p�M�_��Q~l��ENe���7�݅��2�:>SM��d>�U�/KG� tH@	G�|;:��L"�>*(DS%�֭���7		},���ؤ�.�sX��Ne�yk��y�x�ϰ�Z�7"#���߉礩�0>O�>�[�z�_u_����-B]��Tg�VZ��M���ǚ���ڔV����� �9��Mw�����Q�<�B�+z(V,�x�i�
$��U�V�aݫ�Mi����&_Nm����	���\��9��1Wَ��O��G�?��tE��OXi���)o(���Ϙ��^Pl����f(��O���_O�'��O\C�x����Gwŭ��w�U�{�۪>�2i��^��(=_V���ӿ����/��>0�mw���<q��I<N�r-dijd�tӄI._��Q�
�H9�GI�8^^r�$��� �-Y����
ic[�pi`�-T��Q#S4��E�>��;^/�%}�#җ�J�.1	��R'^U�$���%p�YET��<������!Q�gwB���q�?�� "+�+T�FX���"d���ӂ�f�\8Ғ��6�V_���Eӝ�RK��c���%�V���h/o[��$���z�Lg��|쩔{ln�����S8���B����e��֙�������7��B[0(�E�d�C���;'����XZV?)@G��x����xG7�k]7]!/E�5�4�R�W	���^���2ݽ?v':��W'�J�-��Ҫ@K+��TI�J/J�����x-$Bψl�At���+J��������~���Unt�d��1����U����]󫚛5�����N�N>�y/�����D'�e:��m[����Y	Љ�p�� ��Q��$�� �������v�(�K�Y�r���"j@��	��+�x(*t�H�з��Z�H
Q("�UmۆCzU�fm�O�p&�g��0k�&���<��"A�`%>���9�������Y��8���N����E��O<B�'� ӣ�$�J��/+ ��̾�`0#�#��&N��&�������1ݿx܏�	�9D��Pry"\[\djΌ�s����OA��w��	|ʵ���̩�
�r;t��c+t]"�F�9�j�-��}�~3��vwe�js4�e��rv�Ihl�js���V)���Q�vY�U�)Np��^��NB��\��U�ް�l���a�=����*��=8�`aY����}��H���;/r>g���g?A�U���!(�h�$�2r�q�Ϟ4n�B3	0���|<1�9{SD���;�#(\�XC �%��$G�t��7B���bƇ�/10%R���'N"�b�̄��z;:�����4�Z�H|"�������_�)���Y�s*3�	$���j����U�ⅿ~Qj�W���A��G��i��΢���C_�*�B��m}�5������9	���%��L"�%t��%U�0� �'G��arB!��2� p[�2�L�0V�t� �P������h<~Q*7��O���9XxT����^���K�u�s������/�s~���%����2���VZ�������&��?q�RLx��xBek�÷��o�X��`�j�c%��*�"��FB^��	�]�(�K��&�$�2�{�V��?֓��D��>�s���r��!:���z0q!3D�!��5���J�k���[ݕ�"�G{�7��E{�[-�J+�����E�ax���<����`a�� Ep�C3K�i���3\�;�j������ۡAb�"�gƑx��^ފ�s��97�e:�g� =�c��.J������K������*�
b`�U���8Y)��E�>�}�!k��Ǎ+cpp4fK�.���,�����B[(!�u�B������+N����^�S쥊���L/{6�T���5f���	.񪷭�ߨ��L"I�6`�)� W��:M���]2�E�����pf���H��\b$�8�t������b	�!�Y�a���Z��ѵ��9�;C�\��"�/�&�:g ���<����%��%�}�~9�F�v�(���U/��S"��W	�j��:t+�p�a_0�4h�vNs�0ҝ1��6��
P�(� Hs�9i�����1ܻ����k�L�/�C�S��V��S�#P5ν*��rÃS��o'u���� Q.�z��n���7��K��C=�9�k��8��
���e�ۄLK29��7��֡Ϡ�|6��I�f�4��4_�|Z���VYIe[XĔ��&/v�lzƎMQ�{T]`�\��u.�f��"�{4�i���+&����=tF'w��Q蟚��"�Im"L��bz��k06��J}�A�Y�?x����&�}��v��Z�#�|I�ꥩ�`�j����f�< n�Y����W l�����cԮr�$��gip�#�b?(�/�` �W 
�(#K V#uzcn���ՖF47����9[V���R�(�%���u�BBm՟\��h�jb����0��B�����)B��mq��,\cT-�m��iG����ӽ�*g�AL�.{�cW��N�Hل�|gu? �}>�-��P�>���F������^7��_��3��4�P��﹜���Ż��ɼ�O�O3�s5�[N�G��+J+N�8�b��9B|�H���ON�c!�_d�ю[k����+���B��&��lKM77c����G�1
�ݵ�Bg��p�(_|��#�r��`���!c��0Uw���ťۚ�8SO7_cTƝ�ڞ����:�3c58L֙{A�+eVi�G�+�;��O��B���ٖҧ���-�TOc�񇕇TgTmz[�-*S:_�'y�D<�~��HUU;V�K�xp$�D�n�֖��A�χ�n�aH��H)�sX�!Ut��~���؈�d�U�:�v*���Q1w��q/wm_^��1~a8��J����݇Sj�0��Ө�A$i���T1Fԉ��4	P�y�U{��cUV%B�j��|ř���^�+lH�M�Kr�6I)�k�SwmS�d�kcT�ݵA!����v���
8�=7���{W�řJ;a4wmiL0^�^%��o�SQW�[b��c[�B��	� 9�Pl}^��E�!�mFL$�-XBDo�����.5k6 ��������kCb��.���R~�n�$����c?�D�KN�:%Q
l5g :�ϡ	��1�	x>�:��lBw���u�!�y�w��@=�K�eV>��Ia}5}����͝"v�������v�K)�x�:͂B�Gܥ=���<7��3�n�欑��;�{3�w�M~�E��l�u�ҝ�=�82lv�ϰ���Z�m9������r m���O�o���χ��|�d�/�Թ�řj"�Qi�GHo{TƎ޶�>�a�eFQ�4�񯶢5[�>M�S�#��8�v/������t6[�W��d����gK�dٟo��f��-uTc�UUMwm��-*��\��쑺c��UUXUU9���D��6xj ��Jɚ>�θ�6�12р������#�>^2B�"�(0O�֞8�A���J���|���r�Y��d��Ii#E�	$�)mx���x�u�&�oL.N�νř�d�^cTL�][%�f���=����,��{�&����"9v1��������h��&I��j����v<��Y!�?�
�ή��5F͐4�뜶`��G_]��`�0���-��\���SK�/� zRN�p�J�F���֢=�ǖ]�^qr��d�Vft̙*�]��L�4A�h�QsC ���"0�EU
��F�=�
8
y�f����{rs�97+�܌ùk�SҎ|�9}�"}�x ��a�T��.#�ݣ���np�5�|���A��#��K�5������<hhA��Κ6o�fjH*��*Jh%�M����V�"�c
	SZ��H2���,����M�LQ�qb�X� Pc�(d�B6Eu��P�F\bm��m|��@Ⱗ;>�P�,��c���Ϝ�v��k��&�.���	�/f�mQ�o��f7���cYoӱwū��k���mR��8�~9t>�� Uԅ�Kw���l��D =�E����g��y��C��0e�lt�x@d�!<�EE�V��g�)�8��v��.i:lr�1���q��MK�d��C�>/�<J5�ܵE��0w�
���b0��n���Du)c<.
0!B��U��Tem��ڈH	��5�H#_:�:���_��G �{�@I)�Z?e�0�v�o�7�/��3=����g�>�����&��K��Nh�F��0˘�^L8϶��i�p�K�7�(Q�:L&�+Q�:�;�xW��e����}'9hs�<Y!˪;�>�Lg�F&i���5�<����9�j�mk�W���K殭��ߜ���s�79v��J�4Z\a��A�*�'c/��<�0C"N���=���>���#��R��e���x*�6V�*���꼤�2��g*��o�n����=>��awm1M;2I眎ͽY��K�SQ�)7v7Z)ۇmD2���V�v4k8��C;?"(��B[7/�aB���I�A�*�ss�4��,ݵ-Qwm�Z�]��K;�ԙ�2��(��e��m��$,iHP�� ^h|�Ag�m*X�he�Ȁ�M_M	  �z�������S"2"#"B
�$yP1d��z`5R�4����'<���T�^��@t
:tQٮ�&I�(�vQi�P[l-��mq÷�=��F*]w�X����َj�������s`��gf��s�����	�=�r]ƥ+0n�;��ͦ��9�#C�����O�-�M��
���7e��#�ߖ��
BU��\�cDCI�C`��~�Cb!V�B���v���^�)�?�13^f���ȌG>��'���O(% ��b'!�Ȗ���-W��:�U��?9�Fv�m8�!@ZV��Rg�i ����%f�@�bD��_��*!��^���i�:ֱ�[]�(��1��%����C��\�z%_1\��  \x2�Y���fX�I������:b�H ��8lx��65`!��K� +۫q��4�:.ܔ�dl��`�b�ל���M ���� ��F�K�'4�sմ�{<B���cO~4����c�Lʪ?��|��#�Ѭ��`�h����QC����dV�O����@��X%�T�l����~0�d�)%\�x[`�i&��o;���v7����( �`(�/�` �X Z�$P0+�b��	@k�y��K?�*X���.*{�>Vy��Rr��ɠ?�EFJhL�����(�eF�]�~֖~2@k\��d�d�-��)16-lj`��|?%�I-�E5�v�?{��%�3y�?DHё%]]]\n�/[b�� ��fE�.��38�����t��	zIF��A�����`�@
M�Ш�eP�%J@8̉"e��ȡ�d졧��q5�O:O�H,�r=n��;����6�)8���xl�*�A6�䅅�T\6ȃnӐ����Ջ��屺5���غ[�W�?��E��V��x���}��2��W�e�eT�%5�ȁ�L'b���2.�!��w]�@�#���6ʧD���<�q��Jv3[a6Ӂ�V=}?%I4���#K1��\��;{��ШMg�6չ6}����77m��l7ky��-�)6Q�W���wc�@�� ������@�s���b(��!��i��1&�A�u\Q��B�!�F	m�=����T]�X<��P�kS�mm*�MC��a���l���]M��Xٷ<�W��X�MC*	�5���j�TG����a�\
��W33!�9n�GpsF^��t�[�`ƍ��L�Ԟ��Fb1��~�⡰iH�ڐ�4��5�{��G��C���6���Ŭ����!��ՋZ��
�4����$�|��S�3v��eq��[��P���k#��2+-�P�<���d��C����Jgnn�KX��Ke��ǐ���R�VojO���kј_��PHjYL{��<V��\O���q&�Z�L�+��-%�9�A��X��<���h���� ��a!>ϖ=OX�<)(%.>O�L �ᒊ��6k���[�co�����}����N.�>A �3��>B��3%�ku0D��33����p5}�W�^�h��]X�t�=W�qs��c���B����儉ġ�.��E���w^�P�k�M�Mi�\˦���h-������x���љ�L.�>��+2<87(��EKU���`j���5TiJ��Ɔܥ1�(*2mpcrw4�?�x$�^�[�/��σ��MI�-�5W-�%��Zk+Z[��\�Ӈ,�uX������˼�l6Xӭ��O/��2���U̖rȄ���^�`�IC�fX����s���[q=䑨w^q�'K��理�3��d�Dmj�X�k��C:z��=�ݘA3�����@ .�_W���.T���t��!�lhX���~i�x�d�$Ya�2�HqG"�0b{0�jX�H&�I,�����Wvxt̢�}��}��Sp��i)GZ;z0i�c��b'"ND �P
�����SbZ�����xı�~z5g���+O5�i7��^�0���n����ذ�dj�y�*���*2|dR��P���¦�eM���=&��n�I��'�t] ȬC����H�E�R�;����3�XX�\V���= �H��F�P��/����fL5��r�A<��QYb���Fxp���qE$
�c�iH��]����͋���&>����:�+N�T���Ŝ�<h��C]��
�i��;s��kr��!ݦ��Q$��Ţ�E9�6����>�6�v�):��0Ni��,����X�r�"r�U��*=2�U-�� �tJ�C�ʝ�#��ߎG j�>�cE��i77ei���xR�����}��;����;6��QmX�K ��u\�EMy�������EM��w�_X��Y��'?l�\d���(`',=��k#c�0�-=��̬9���	�|��|c�����Z�U�r:J�����-�ͻ�7��.����ϬC��HY�/�O���H�F���ѫ�9m@0uÉEU���6 ��ҭh�86qd2���B�U�٦B�W��i�ΙG㰋��0=�$���?��Y���u��?�:VV,ZPQ���Ã+���*�|fP��u�ߋ�eO²F砣J�2��p���E !@>�v����os�w��t�� �0y,�l?��?�L�Y�H2�Q��1p�Q�N��a#*q(��d<�x(|���}O���'��b�?��}��K'b#}2�Gi�X��B�����[ࢎ��e3�%����G�[�d����?<b��9���'lO�_�
_R�Ie�xdȔ"M*�N��Ra"Abu#+�F�3��w�����+��7���]��a���>����4��Y�PP�؁��E��=<�X��(Ou�_s�jN�j�f���m^���9�6����}�K󉆳�>p8s���D$� P���1�?���(b�?^0����# ���r����+j�騱 �SDFDDDD$M�`����`����4ɰ��;���&�)棂K�4�i־e�\�n|E�[i0�+�N�<@W1����X�>���5��$��*�L��3�`�[,���Ț\0��c���� g�K�7�_��\�������̜QG�gQN5�0���CY��M�����J��:%����B]���z���H�l5d2E�[B x�����|6Q�#�<䇑/$=�z(%CF4�J���-5� �]�����D���5�u���fy�ɑ_3 B�6O�w�S������D�;H�a ��b��p�[���@�K�_�$�a=�y�& �Pϔiࡵ>��M�I�/�k�ђ����~�m�� �;���������Ļ�_0���\���Q�ӻ��}����d�P&��jHu����t�q}m�襡����Ė���?���Y�(��$���B�p�i�J7*�.�H�����AY�Ny�l%i� �ɂ�e���,���p��F �U(�/�` }W J��#L +�b#�_�B[0��y��m'�~���	3��za~�<g��U�U����I�L-���'{����7B��2�51x8,}��(��9�|UH�݂��'T�Y��'�Q�%��b�&q�&�ؕ�i�zd֎��٢�+�f�j:]k�NW���Ē5'^���;W᧳c����O���ԭ�^��6�{�p��{�C��3�*����U��ő}*�9;���U���h#�LB޳��ټ�T�(��IY��]���t�ʤ|����/��C8�  ؐ�&���!Hb���"?8K=U��*N=UbM������q�ź�㗜�;�����c��u�ݱu}Ee�:]�s���;;���Y��P.��I���v��=���G����u�>�銣\�옎"�ė@J�?��+����T�`�U`_�|<@"�����2k��L�N>�3�&�na��]��gy-�&@�<g2ݮt:o��w
}����k����&iJ�$�+Di� j�ƺ��%Gi���[I�n{Ee��t�]Q)�:]I��z�E�Y��J�Jގ�r��Mǎg|1���p�[�P�����r�^����W�U'�Տ����~e�U4�ʲ��K��*N�H�2Cҵ��Ȏ����6@�[輈R��B���H.	�`��z ��!�|m+i���X�%�'���]/(�p,�ҧۡ���Y#'�u{YzO�=��ڤ:]S()�x�6w��1�M����odϮA�2���A�?�͒��)6�� �B$R�!k�G��	��"괠u�?%Z�<�%�$���o��wu;�O���? Z~{�R���k�f��j3M�NW�%Y�Tmorԭ�����g���f�0��"�{-D����D�S��6x�h��,8��ٴ�=�ˏo#ZZ��T�6��zg�<s���nA����B�����$�NQPEK�KE$R�I;��;[�Nפ%��K='Y[�yN�8(�+�� �i�vo����'�L_Fpb��<|	,:���h���۳	u9�c���`�̡f���{�Z�d�[��p8�!iE�2z���(��5W�t-�n%Ӓ��r%g�2�{����܈�H��K�՝��`�
��kFH�e\�f�%�j�<��F,��a�12��x���E�~�g�	�]�܇��%IƼ��d'����G��e�ud�S���:����%v��U�i'i�������L�Kb+p��*�t$�3��`cP�T�b��!�L��m��T��8�����4 ��Q���pM�a�1�?�NW�$���d��)�*���	&T��2r֜
6�@�A��pTA|D��ˏ͆��	CA�:B�r6F���Z`��}�D�������,����((#�&MW�*4�M-p��Y8;ހ�l��B��A��g�
kP?p�M��*<t~?h���s���#�!B�z�H��q�V��x�]6U��;�@�TϠ��#b�&�)��5�+4�cSh�FCm�ԭDs7���v]tE[��zT��G��t��)�\���5��e�9�<I!N3�Ď�v��%ڽ�}(�n�$ p�\zc��l��#X$X�d6/`X�q���C��2��$1��#��zA!��#�B��v�����~�a��&�$_JKҤ�Z#Mb&�f�ğ|��dUl�_�e:�c�	t�ﵿ���qHq�/��U\�y{E�4��:3kF���n��K�		����X2�X������RU�(4j@@�dp��4K����
�C��-�%d�+� �<�VC��L���0(��z��/��5��4�jn�%��v or�\s�i�a���7^D�X�{D}p�X�@;���ö�I��h��E.鿶� ���=e:�_�,��QP9Mz��n�̍Lg�REZ�W��In��������`a	/P(�bX���k�mYq�r�F p�ȪpW�>
�xc�%[Lb�H,��H���-�O坝�8u`����(`�h�dS�H�Ԡ��K<�C� $%6�����|p�j�'L�"Sd�� 1M���c"�dH8��A!����3��0Ϧ�Q�צ�j�>=�:]�'��O1P�f9�3~����;����Q31��,���O�	5Y��JeVe��8/�<��tI3�#Ox5���o���|�b��sh�s�G5����њ2���/yM6$��X�LAЂ(�M呇}���֏�%n��N"�(����lF:]��'��T~r������Z��h60��mþ�1��S}��g	�⨱(��4#2�H "
�$`�)3@�bYi�����) ��ڱ@��U|�\�A
9���5<��m�=&w�ڽ�Wn��V]~J\ +f�����ۓ#tx��
�)��$���� U�Ԃ<F�\&��n
����A93���1f-żfV̬�,p��)�Ȭj|	�- ��npͅ��*��o:K�46b�S��|U��!"m�!��9�X���_^it!<.6ÉB{4��
U��U�9l.���&<^G�i"<r�`ك:��$aj�7��¾F�ܐ	�1QQ��0�8;a ��8Di�}�����Z�x"k�rnl��֖o�:����6��Ḝy.��H�~�����K�[䖴b��Y=��?\�`�'�|�PL�'$Rn�#� [��ķ2+$�+��$d�#��T��T�`o9�	�J����|��9�m�Ǜ���H�a��\�m>�v��2�����0B�0@��t���'�"�J(�/�` �Q ���O Zu���Oì#�"�wE��c��{��Q�L� Z��t�v�85i�H�P��¢Lv��:|I���񿠕Vb����{˔������*�A�:�ԁr%�<P�@��M��'���"���⣘y��c�F��7?���x)�/)S�R��Teղ�TV=�!��-�ml���t����r�
i\'�����m$C�-4���J�r�$�j� ��#��K0�R�geC��-VX��8/�s����01�<r�Y"����$����~�b�Y���v+��3��(�hf���I$�e�Mq8wmq���h��m��OF��C��WI�Z�>̪�����.�&��x.�ͻ�9�F&�$�1�9�S͓�QH�����7���T'������>:��괻�]���������J:�wg�o<6j��HJ'ʪwPXr@h��X�%KdU��CqG*�DB�O6��O7��Jq�5l<��MӬ�C��-��Z�m�����H3�6����I&��J�ho/*lq��YarȻzL��Z��-B�'J*h�	���͵�,�x}��b�=�ψX,�j�ۈ�v�^z�'�dU�Ȣ0�f3y���M��Ӛ6�m +�uj��g��+$&��u18P� �#��.`z�&&�&)^�ӥI	�0Bs ������R�",'�p� e�*�B��X"��}GF��o(�xo��ʲ1���l�e���v^Z��ܵ�	�t'�y��׵N2�P�d�	�N�����s�����=Y��$`�|HU�O|��v �|�`�B$f��|?WY�a= W4,i:YuS[6�9��d-s�V���kk��k@��S�٭���+S��9��b�5=�x�qJN<�����@��s�M�TF�`r	�)�jL9IH0�h��k���uǘ*�V�q��n���Db��H잯k6�D�n���^N�~���FLs۠��J8d9���:�.��� �65����9��JBi�nx�s�7Q��I�F�`��C���D��r���L**�0��HC�*�j.[ HD�!�*G?JU��(Va؉�H3��FY�g���A��ý��N��Nж�u>Ϙ�Q�[�{y!_dLs��O|o�{��F$4��͙�ښ���>:����^J{#AΚ��xѻ�y+��9�_}%.\��s�+U��������S�嚻�5���=Ҷ�'g7+��d��ߐ����˯���:���O����TYï~2
d���ƫ����}Ϊ,Lemn*����㦞[�|����QQ��	����`���e�s�][\˩��Bдw��LWz�C�����s��,i����2弚,l6�t2���X�z(p*R�3K?�)��L���N���T��ъ�#��b\�*ˮy�un�9�i['��|��W�f;��L��^�"��W �H��o��i���'�z-7Σ�
	<:���R�2��熎C�.e���G�:�<��6���.͌�e��^ݴĹ�����X�m�ەo��ɕ$��^X�Z��)KXVt�#'�z�{��L�;����_���l�;���n<��ع���lo{�-O�-�y�k��j&���1�ܨa�1�dN�]��1��Q̕K�p�Q��q0�G@��	�f����~ܵ��ws+�C�3�2w��g�����;��G�|"�(�|����r�E���M���0���̝�Rʭ
��4Y��Vh���aF��Y��*
�#G��L�1:h0%�&"�S��/�U�4�"�G�p�QH��)�C��%�~=�i��P'�����NL�Fp�+�Ue��N�� .|�����et����&i@{{'@ �|��a�`,OƋ����p�Ņ��˼{�9(p�ugݧ��ω�H35mڛv���l����F<�z�4Źwm{�|��ը�z%Js�૝�x ��K��t%<��c�������s9n��PeiG��P5��؃�)��sc9��l��H�ڧ�����ƍ�*`B��wd>q�Є��[�OSX��� ǔl�`�y�E� f��!C��� I� B,��1rMI%�$�L{���
�n��njh5�E�'�a�S�@)��5�t7��L�\d�fx@��0>�ߑ
�o�W��J�}E�LTO���~�J��X�]����l��nS�x�?Ѩ��E�S�+���)D��R^ve'���M��e��"Iц���𰔷��.��/��oڏ���[���-��}�
<���ǻ����u�15��jW�C4�Q���% Gؚ@�F;q���5��`�L����W��0A�T��c�%(II"$7��G`?��͠��s�>�<(i��"�	����.ݛ�Ns�A�z���B��y�u�@��M��P/?�r�0���є�w�E�#��C�4�n�z������#��6aH2gX�(N,���J�/��96�R��,�dClb��#�����S�́���x�f�7�p�W��KE C�	c�F1x`�]��������q�`t��dH��*� ��K�_@^���
lB����TzJ����굂��G�c�H	���CY<��R�aO
G�(�/�` �K �~`90jm��
q�OE��T6ϙ����B�vɪ���ט��
��5�������-e
���[����)��ȟ�o�p�A����N�(�&OmQr�ܶ�#5Q%�dZ뺹�5�_��};D��Y��Ò�ͯ��y�}��%_�Q�&~��穧����=�� �M�����|��Kǒ�늿��z����t�����~He@G�d��^�����n�;e7>+���]� d�@�	iL� �l�x��
�L��z�nE	�Lٴ#�Hd_v,Vٗ�fe�gq� �?kn[jٍ�Ovc߫Ya0�'<�<��JHh�t�wu���>x�z��LO�t��}O$�
�ʖ*o�s�!
���r��'����m[�zٍ����<��W�W�SH)�����3_�<h��p�������-�n�&K[�3G���r]�;�n)s�J�j--h�X�_�u&��d��k��n��]�P�	6:a�3��ɾ,Il�jQ�hȴ���+�h���uD�HmV�,�5�S��d�Q-�l�3���q+�S՞�"ђɴ`��"��p<�y��5�=/Vvc֋�YƲ�/�]OT��Ny~� -���MծS�j16�&��T�����4�4=�S�;�,}���X1�j�}���cu:k9f��|]��u>����Ky�-y2Ŝ`��'LZ��ކ���G��u�oV-���Ep��e��e̲oq�>�]|a�ɜ�f�`�X������L"�V���j�����ܵ��b-�C-�b��� _�1�w����z>)�g�����&V#�v:	�<=M�AARg�;{z8��Y@��M�N�"�o^�i"]�J��I0�>�WO�i��B�=��ɷ�a1��MK
�*�isvӾs�[�ӕ���n,p�#>��I+�vyk��hx���5l�f/���M��9��t=z@�ѫ������W�_�|�|	�kמg|EXm����;T��ؙ�Y-��kQ���pF��K9�md36�㊍��q�����n<lϹȋ=��i�aO�att'��.Ew�!��U�J0^킒
ݦ{�b�"!�N"����	k�2� ��p^�����^�s����ݸ���m���+�9����Wԇ���N��5۬z�t���۔D�Y7�A�����B%��=�}Ӓ�4v��_{>������_�����:�N���NJ��t��e_^�-��n����D����%��ㅣ<�K�!D0�pQ�b<p��&Ԕ,�61�d�v���!0rl���0���C��e�fe_��kY�VZ�M\g�Md#6����pDrn�8���㊉�qn�X�n�����^�J@������ג'R�lYRw$��^���}%���L�f:S���d���C�h�F�F�xU�ct�����z��^H8ө�m^���UYh�����ѵ�����0�Q�h��ګT���Z��V���$�=��.�j�-<"���n������r ,�+ ��-ٍ�����kV��_ �kϬ�7������VIKt�6�lVm8�i��N��:_�eʗ(W��{%*����ל�~�K�_�r���:CW�%�]�+t�.�w�/��fen��`�}�;��+�.%z��d�hb�~�0mz�f���ٙ݅v�>amVf��W߆$��Q�N�]�>w���Q�v���l0�ٿ�1����ɫgWt��Z����l��]���Pt�ND{�1�݊W3;���ꟛV�s��j%��U��-���DQ4�l?xJ��%�+��_��}�������J�E�LPR���%�le�����ġ�L�@o#1�eÆ4�����˓�(CvmB�fv��hb��1�BʙI
���b����4Ġ14%)H��u.���Y�oi�JH,���O�7Z���k��rj3u�o�����E�G:���=?�tBCǯ���vJSh-�G���6;}=��ܐ��~��a[mU�������S�_���ۤ�;}|	�$�k>��Rx�X�%����|�(`��I�&���*��zS��X�O�"��ZV�)��AC�v^g���2ìc=��/���wޜ�EV��a��V@Вڡ����E����W��"�c�||yھ���z�t�
�ϣmCG�K%���S�g?��:v%���>�b������#u�P6�����wh�Q",�jWȾK�g��1�Q���x���ǵ�41�k�����3����,��sd�A����-��|@�$��>���R"r�	����XJK�Ib��
�m��z�%̘�k;*�����EP�Кֹ���fͧ�J�8GLb��������`x�=�� �Nr<Y�9�[�2Xo�J��U��:�u���B��Jb83�ow{F�Ǒn�y44/%���'� �,44���S	Xx�G@A��{�����@������� gT(�/�` J 
zH=@�Q�ұ���������ؿ�fJڐ����w'H0����9�uw [�F���[�M�)���q�H��|XAgEΥv�(���34�]�,Xa����뽟�`���~0���ͩW�8��47:PM݉8�₅�@��C�Q;c��^j3he}��]܉�5-�S�ۤV���r�vm��X,r)�������`�_7Gy���W}#��(��S��T;�ֳ/uP����	0��̺S��;8З�S
g�Xj;���3@�_��_��~m��{ 0�����Ca�E]À�=-ԯd&�l��iE|�2� ��gOt���mW0.e����2��m�`��ݩ�Apuu*>��Sa�U{0���Apu��W_�'�n6�9����3uK�n��!?Ʒ�֮-�\[!���=�c�f����Y_̺Qf]}a�0��kf�_�����~���4w1�"yGhȟq���$@J��f��Ѧ��X��mB�c<�Msó;�fn�#YIl��^�ՋKY�B&��*�R~�V�ھ� ��/Ѩ3�a��j�n�|,8�Y��f]���D��$޺�@�a�y�{5��[�ɒ�J0�d�x����������L�hӡ�a�L�J!�W�����E��Q^��.���Yw�0�������cN�C�xv��e�����!�R؀��O"��Iz�d�2r�ɘ���U�M[%J;��W�G곰������Z�[�IRQ9�R����W��_}wc�����[~�����C})�u��0�
}�:l��1�r�����ӈg��y��"N$$���&�[���a�
�
���/ƈL���Py�C}�{p`�hb�^��j�����a���s)���Zb�|z`f��
s3�V���
VUu;�j�V{YXj��W.�-�rO	��/���jt\���o���xe��(��ߝ�����K��l;����f#?ƅ*]�
�40�-s�k߷ߤ�۞�Rr۶�W5��yF"���Otc��8��=����c6�SA��l���ªO����O���[|͍�]u�����a�Y7a�.��[U}l�Y�R�ɮ!�q{�s��)��q��N;�c�0`�@�ehhe}��!�b�2mk����}rd'��`__`[I^��$�Vy/�� �ėG�a�%R�j�q,/�Rǩ;ѳ���rQG��5ԯ�,Фi0#��h3x`��Μ�L�zM;ҏ>:^��b���bKlyȤ�VKU�Rz����d���G8��?��k�{�r�����%7t����X�U P�i ̺@��bLĭ\Lӡrϰ.]�x�Ϻg&�����S��b'q�E��v�@���P��d8���q$�J�##��62��	�yf�gcj�l��7� V�L���LI�U�
|����a����7�e�_�_Ӎ�c��U�����
fݫ$��x�b��N���5qx�i��I�!L�4�(�o��"�A��7go��;{E�QH�<Y��m?En���]_��Y~g�$Q�Jz�fii��/%�6U,�����zV�Y�u�,�u���$̺��� ��:;Pi�'�l���ٚ�yh�4K�"Ҳ�E{�E�(1��?���%K�q�4H�?��-^���^p}�Qo^�8 ���*v�y _��R��p��$+Bt�i$7Z��i$�[[{:CA�K��\�!�D#��ӇF�<YO\Kyi�y��p֗:,�{�����!8���n�(}6�O�Q����(aG��@����6\�;�$q�B�:\�U]��ˑɁ��,�5���$I��B����4����$I�0Pf��#��n=�����i�ϧa�z�����Y���EMO&$���-6:	��a9b�t_���T���ZѸ��0�6�z�4�gQ!J�ʭ��D�bzj�����k���(����I
�#�(i����i��t��0�>��I�ق}����Q�:�s0��,�f
lȱ��h�B�����eI�U�AA.L��PF�dE��`N�����1W@�ӧz̵#�Md�g5�Y����	�`c���+Ta��3�RI�����ɸ-R����U�L���X��Q�����ǒ�Cc%0c�2nZ����a�m!"�ΔPG�f�3����z��4D�#�&��A;##�0��]6��T"h�Y::]��1��s���w���W������b�!��B$m
�c _��]���^p	�q�S{C���	G�6SsG�R�g-��_�����=>�+�K�L) �#����"Ѓ�K�����y3Dh vI�ɒ�7P��X��\%5&�u1&pQ�ƙ��]���PuȻO���/FЀ� X$F0�{��BQ�8���z�:��.>�(�/�` �P z�$ Q0�*��n����w��)蔾��F.�{5.�~5ᣵ����h�i$�u�_������n|�$8�wSp�w�fW�o�J�meJ���R=��Sf׺4
s)�'̥iP�o�ͅ����l˶�U��֪썵ia:�z�r�q�4F��QP�BQ��H��l�"G��""���$��!rY�1N�/�����ڟ��'��	���:[hs����hx�N�ԭ=�̝7��>��8�ze?m��p7X��0�UY��9hH(�}�/܅k�J�$�bӈF�&źwb���J�>��ٳ��Z�>��}S��:�~M���5��(Z�8�yӈ@��7�G�9��p1�Wx�#=�޳����4�GȔ�+�d�̝���gs_ �K���6��uͦ#Ns��9֪lllUv��Z��ᠸ�k��#�����5@<=Mc[�CC1�Vbcy���Jl� dp��^/8�y�f�y�Hdt7���
p�<�$��J�aۇ��3����y�p�r}ε����侣����&����[V��h'���>l�^�ʾ�Ve�nU����iU�G����p ��&��G�m��\]K���{E�k����]g���1mU6��*;C���<��|���œ|�d��+�~����ڰf��u���1�*$�MD�`-4Pd�A�M 	�F<k��5	TK��@%�nr�/W8�t��d�uv����?~=��pP���%�p�9%�p\*�x<�庎hj��h:��	s+O�>V�~e���\"��fW�O�?��4�f�P��]��%��m�"���%�ݍ��
���&�I�;7�@�$����DA �;��<�[����6��)1���H�i\��T������#�7ۂN�0e�ؼ�Φ¹���*��JB0"���Q�0�鬮:���9�Q���c��\Q�*؂�&��t���;?e�H+{�Bz����z���/)���/�f�U�dk_��?�ղ?n���ʒު���VeM�ί���vq��&��q/��{�4v��af�1J��v�(��A�&�рN�7Z�ϐ�o��0b{�4�y$H�|һ��l9�< ��/��5
�������(?P��@h��]'?}��ht?5��`�{��	����A�f���g�2��ը��[�[p8�-���+c�8&�y�w�|�=�>�;�߽I��M��4�����jO؞�f��K/�%�� ?�����	�����Odтr{9X�@�����ֲD�Ӂ��P�����7"Fs�hlD�����f�c��v��%.�6��# 㜭�rW��j丰�KN	�68}�	�k�cvbp�)�b�`S�/.VL(fQ����*D�����( I/g���͖[?��0�hJ�.ҭ#F��õ9�}Җ	Vk�HWR�B��WUp���B�]_�%b��
uŪ1�lc����w���J�!�y�3$�����]�
r���0	@Je��0	�q%Ā�/ d�l���x��a��;W* ��N�����X1��F�iBߡ3��� `P8�f��63'\מ~{IG<�����fWl�~�t>
/��HF���H�B�
�tB?.*����ǉ�W� ^Í�Y�TlAe�3r��*�Wv�F7��G�W<U�8�j���~૦���v�,^���Y�?�;����ٚ�!��6��PA1M!eSt�Q=��zy�� >� �G�vv�*�&��l�á�f�����A%ᚦ�'�ִ��r�=�R�]��t��g�@'�:i�~q�<djY�~�:#��ZI�H��w�3-���\X��4��:�h�?:�(��~q'��2|gb��-����ΞQd�P��LBl)v�&�r�Ćb���V���1�M���/8��G��4q��xI��#(��B����iJ��Bmv�Y���.�ժ�K&s��5�a`���CK7���ʁi�� �	rY<���Rv������=��*Dl3bpPg�(�2�dʈM�X����S�*�l��
H
��4(����,�k��)�N��A�g��<ᚚ�[�M��4���h�*k�(]�s�{%�����؛FY�Ƙ�쨡,f�D""""""M�6�1� u%KC��$�*��~��}'~�5�R�����{��b%DGq�����m��ųQ�
��0���t�d���□U�À��(�-��ӕ[դ^�}�>L� {��M��~��D��V�&L����Z���6u�h1�o�q..uT��q@�m�?P����&���y U!�����3n�,�cox��Ɇ�� ���$���"��ez�[������&��uaF��
y by"	�<�~����1�|D�F�Ti, � aG,�D5��)��H��ɹj�������<?Z|#1�_EH�|��y5�-�ړ��� �� (<�����Z����V}�a ����=�	�:�(>(�/Ew��1/�)�b�M ��p�Ww;r��i��������Ə����z� L�Ɖ����f��r��\
��V�*��Aq*G���B[�==m�ƹ���'F��E���N؜�)d�j�A&�4Z�`�9a�L?��P}||�K�O
(�/�` �T ���"O �*�BZ�s�_��ӆ�k��Am������O�O(%��glI��0 z��9����!�0wP��6�^���Zii�N)"MY:�rE
����Y ?�#�l e|��k��^�m}F<D�A�������UR��řVH9��9���݈��p���9Ø]���]K���,$KP�\d`�\$v@ �h�5�4���������}	�S�%����:�tX�Vw��R���7��tQ��F��dSbS�,&���̔s���9�eY�s�봚�R"=���s\�kie�A[ cXi�ʏ5�`����g�y�����MV�=cԑ4D/���Ş֜(��Z|[��w��(VWw����|C?2dxH�4���颐VY]Ľ*�>�J�Y]d�
���nJ���9ا)	$�` ]Dɵ]��ڈ��v(�r!Jk)�㕓� `���������
�"���\�ej�
&ԁ���U�)��;\��i�C�;	�HN0���)���'T2� �*�N�I�r���9��,��SB���%9�����d�(�����of�۶����^0��`Qlc�յ���t/�ӽ(��lE���J���a��C�A�d'��[�Ə9ؖ�98�i8�a�i��n�=�y�y�gs�Ӝc>�=�����A'�pH$g뙉����b��x�"Bg��C""PPD�0cVA8�jif�cDUA�Ip��$V�5��X=��
��D�x��U����X��mmEB��|9d��.=�4�ꤋ;#�����YU�EU�Jڌ�MI�v��+i��&�ę|���A.�1g���m��ZVp�#��ᑄ�۸7�.��K/;�ta~��d-`��ׁ�9��q���Sï]�K�젓���U A\�Q 5(U֢!�H T�<)���[�L*
�)���w&�@6u�tNu1�0�v�ӼE�o'���X�Y3N�u��Cs{��^�?_)�<���q�bR��h���=>̕0P�J���cE̙ob�ؽ1d�? �b�>�v�15����D�ҳ���������o���5O:C0ݥ�l �Nh2�L5>OG�2���}C��dɁ:���>	��YƱڦ��؁A���1�q���i�[6��g��l1e�6�c�]���,�^��n����j*�`��OI�=�T�t����4i $�����P�Vbg5qs�[
ЪV�q�HMPS a	�X�H�m8j`���}ؖ�k��$��a
o�^�{y��J+��7W���'$���ɪ�gD#ښ��+4�
�\�5b�0�v'�Hu��-����.G����,}�'�X@�C�U�(YAn�X�ń��|� �l~��^���R��ي��me��.÷/o/��/�\�d���\�_�>ߘ�W�t��KE��,c
)ܠ�,�� cl=&��40��u�
�6�N6k��E�x������wuST��⚬�h�����B��&}d$1uYUq���U�L���R��P�%^y��΄`��9��V)�5�:��+��|�Q~>0 �9�㕩z�F��
�sw0�9��9�6��N�}��'�Hl�O�!�(uY?0���E��|@@E�n���}1�|{6@;FP��4pYi�^��&�02�y�x���ϰ������(��i�쨇�T�Lk���^��韷����.=w�9�2����[�Ο�)if�����p8��S����v�^;
���y���M���`ky�}��'_�Ȫ����b��caD8��1���e�|�G�����L���LE3�y�e���/�Ғ��l1J�������{�|�!Q�|���u�u}�2Q�Ȝ`�����{>2O�Q��a�������f�Z���r6���$?#�3V��~d�D�M��>�Y�&�
#�Y�ǝA�������������k�m�w���W�i��.�/|��#�/d?/�MI2\g]�O���R^����W�fR>������#�(��='� d��n�������#sȮ���gn��[�8�(�a��壔`�@I�g��K����^J�Z���L��l?������tb;�w}�0C�1�7^��%�bk�u0ɔl6f6yA�A8����j�a�.-(,�h���ψWw�ɪ#�ZkKb���d59�Z9�.p����\�4�b���#����
��K�a��J�����iU�;�z}����}�5�j�)���ߨ�$3�!#"#""")h�����,d�I�i7��~��X�i�#� �~>+�E�Y�W�z�8k4�A<Iˬ<[�}1���r&l���t,x����.)��3��e����%�Mag�y���d�́Zq�p�Ṯ��@����,��U��	��F��ζT�HA&�Oi�D��Ft��$m*������cc�9�.�dU����������k)u�$  0�%b��_�,�G����@b��ڡ��U��,�O��о�TazD��pYrҕ��M:�r��6�h�����;��LcD,��9���]y�/�z�7S�U��'#��`Ť�@��x��D�c	b�����6ۢ`X��e Y
B�=�� Q�E6؞��
��� ���V��	�9��n�����<p³�)���U��\�����Bs�D�i�ٞ0E�@������G�s��ݓo�me�o���b�[���~����^(�/�` EP Z��O ����|(�����v���g�8k��Aq6-�7�䷆�]0��:�P�L1��lM1e���y8�dh}C��(z�b���$2�����p���&�c@�6����8m��d�)O�,9b�ܼ(-uN���Ct�P��s����ĥ��RY���T�.���/=Q�C}����e�t�Qn��<]�0wז�Ѷ�eM�F�ު��Ve��Vea�Z��	�t��|�E��|�A�62��؃Y�5�=6�rb�.��Bo�%��Z6�]A�-SF�d�q<�B���n��p�f#��x��L��-ӳUٳlU�<�VeSِ��>9΃	���x�ؙ�5T�:�odh���9��m�&�2�%6�4G!�_,(@���n���JG:RF�������|ڲ�ġ�ʢf����UYۣ��$��I\��4��'��s�����(����.���Mp�_����
��E8Oܪ,v$^�`�`t��w=bj��b`>pb���d�_�jx%2�Ǽ����~�7k��Ox�'V'$��-�f_㸙�|�)ͧUY٪,��x�~�!DkU���xS��'���U(W�ȏi�v�2΂|�����3X��]fs]{<�MgY�9
�?����H��S�2�K��'� ə� n�B.{����h�[��/�<H�k�x!QXI���y���t��d�>��fPٖ2VFs������&ǹ�dw%FD/��W�I*Sa�x����'�Zc?�.C0�&��؝}ΐ��b��G��?��.I-��R�B�Z�:�VeEȃ�i��6�����1��4&Df#6g�^6^������_�U�����?Z�C��MG-����Z��	�Z��	��Rt�8��	2��y��y0��W��u'B��e�>��\�<ƫ���Fpd	VY~��۬��������C��5��f[|���yn<�Gt�� 7�&�� P�aW�T0 %j�+<��e'�䉢7%���(J��ϑtY#�3p%-c�$jU�H�c�<�>��,�������ș£��ǥW�����ʆ�C�aj��&~�e�=�^��������K�Q; �-��f&�����p��+��p?��q6�~�
�d�q��&�A�%�4�/�]Z�Aq\6H�N��\ �z0[���*0����ԏђ��������!v�Hނ�w�Ǽ6����pa��*���}�Do��v�˞@��
��"��m#��cPGՁ1��/ @���_,v�"�b�",j��#�ꁒ��͎��@���i8����1����
5)6y�n���yS��8r�����٣�"-��l�|�Xp��"�(�[D+
ҥ�˩n	�����n��y���n2R��@��z�as�/C�YIX[S���P�a��+���՞	3F�io�^����Bl.q��[edN$I�Ҋ�n��q�N�o���n4�x0p+��V�H��nF�F��ٌz�����T�"%#x�o_a'�ǉ��X���/�s�G� -��O1e9�ng�&.��@s5}=K��Bߪ�A����\�=�{��A}�M.�ϸ\�����[���#�t<z<��I����K},{���ܝ�,�Ǟ���+NJ��T���b�0�6X�XŊ�*�'���������'#^�RGW6Բ����>�8�\�`&��l f�T�`
	�*.)�5]a��͝3Y����)	>��Q¬���C�p����eX�t:%_z���.��'n���.G=�-,u�����. ~�)W]�䰷��e�#̖13�(��̕��?�"6�4���f��%�:���	Y"���g���7�T�	��?Ӎ�2>��j˚N�rV���ׄ�.g1�f��ᨳ�ư��c�z��;RP��'YԮz�G,G�%&�ɨ]��k�u�]a*�f1�}�`vr	h�[^����B>�኷������[k(��hZ�L���E�e�ǯ]f��dC�����S�LG9y~��g
����b�qֱ���`��X�E�q3o�ݧ�[��7�Ve}l)��Z��(��S""""�$I�������9��RV���^�a����}���$b���H�kn���\�L�Y��lG�r�A�1Y��wPAd���/��R���?��T!��链��i������������Y���1�%ݾ�;>�(��[O�ߕS!�pj1�Y��K8+�+_�V�F>�8��r�"	���ٔ�E&S�p��e��9� �q�f9���^�GŘ	�$4��|���h��c��F0Gկ�C�j��Q�9l_?��2^
@g�j�b�)�,c��U�bg��/PuL��F�]���:���`mT�F���ps��a������o��s;�� #��;�E��(W�@i���Vl;#m�-��Y3,艕qb|� ?��Ã��!/�R�&a��C�|!�B�=݃�k�������R�ɂ1�7l�!��L��Ggĳt��qn�\�D(��z�DjCQ]M�:�hJ+IZ+
�{xo)���LS8�+6sg�)D����#�vHS�����F
(�/�` ET ��!N �:�?��)w�����O������g�j����v�8��.���z6����ː͛Q�D7m�Z���0#�w��l�{K)S
�:��D�1��$gB��g�������D���K�����k��'�F}�}�|{�J���\.�J^r(������W͹���S�Ỷ�(�ݒR���{��r�)��J�M,����a�1�I�/_g���T�dt�Q����/�A�cH�81����lN�����O�7��sY1���)�_��D���yh�����)I���W5r����pЫ��4z��H|�6(DߵE{J�Zt�D�K��A�	Z�y�s���I�dL�$�p���I����"mb1���Kk�Oet��>�?MO��%K.�M?�h<B-���K&}}U���
[��p����޵�	]�D��6|�E�wPw�؏�}�[p*��?z�Ƅ̈�=�cO��"��uh��C��/�\>)��!�cw߄zUw��X�X-@���v[���֔N�k��������Z��i ��v��v�߆k��u�S����Ζp�K�&F��f����SwG�Fw�
N�ϛ���r�J\@�dN$ohU�/���|�P�GaD&���7�)�5��fLY�^�Ō$��wG����Z.����;��^�(��k{�ӽk�+�(��iR��i��x�@�-��L��٦�����l5�2:a��T�qq�����"�X�V�N<�r	�$�hΚB�H.�
!�k��z�V�a>t�$K�4��]_@CI0Ȑe��8�B���@�B�؟�����l�_���	�8��sK��r4��#{tRq�
�z�hKm�%n��� )��գƕU�!h���[��!���GH�;)�BU�� K�"�=<���ى	j	uLQ4M�v��Y��ׄ$z��}��k��@�P�:�u�<���)H`���+�'�����`z�(1']� �9�e�1¦��&�+,�7#@(�Y��� �𫶖��E�i�/��~�{$&�D��hD�(�~��p{ot�@8�hGb(��֔n�]ۡ�wmIp,{��8M&wrP1פ�=��X##�<�>t�Ɔ��KϧF�3f.�E?�� `Qߵ�X:�G\�͜~v�&62�=l�"0b%����������֩�I�_hBhcFV,�P�Z�}C�����OX�<�Rή�T��l�l'~�|��b��#������(����n�b�F��?�d�	�{՟�v�i;W�	��"w�g�&��P
	RsTD�����|��$��dI~<��k��K�b=,���H��,��+�z>��(�����rYlB_��:=�]۠�][^	$�|�F�ܠ��e�*_F���K+~��b�`�L�s����;_�5`UĤ@e�Ya�������7���IDO�cN�MH�АuX��p3盝��-�M�0*Y�[�@,���^�M�E~�<��m�hD�	)�iU��i�AZv���
�iƥ�֔N���0�k�{�wmq����F:2�Ü�Km/�N���A��7�4�m����x��BssO2ӫ�eހGb*t�r6����TG�Ujf^�V���3����Y�]]	��v?_}�ۻwmw�wm�#<8��]���A������`p�Nי5-N���<������R��'��i��sӄ�NW��H�s���C&���M������۴���Sw�7�=upр7-�l(i��<j�%���ʟ�͹��;���t���� �U���_=�L��i�8��J�M��͍,"��]��@�,2О/��Z��s�(�o�R���/QȮ��::���OJ�/E�'�5%��`�q>D�|p��w3!f\�vD�f������6�i�����ݽLs�_���KܜX�o6�
-���,�Js�X��Q���d���&�	1k 	p`���g�L�b�	nb�P��Fc
���OԾ$�����iﶩ���m����8�k򐽀gw���L]�;��ݓ
��ͦW�jtq�8҂f��\"!̌0�!��<(gd��� P��?fB�|%E���w�'�r�5 k��ʣC�/���X����&A-��I%����GzU`Ѹ��/3ݢg�/���\�*�쨱$�DDDdDF�I���A��)J:�I�K{�
�Ŏk�9蘾���3�s����,_�dp	įW.�S���.+3��T/�����bg`x�����fT�=Y�.D�GG{R��+Ԏ2��~��;��~�L撦��D��3T�b�7�b��u�����+�H�dt�zU���j`]���l�=�
|u6�B� ���@|��2��͢;g����<X\�#�A�aV
ջa�`�(��یA���b��(�acYQ^�̝�>��f�Ŵ�>!������P^����RtBd
l���ۭ/\��f\UD��U�X�޻�%�?X����ꃛp��G��k��[v�.�{��P�X!��\LE�k���:v�:�a�/�]t��g
��j��ú<$��֧�$�^�ɉ��2���7+ߪ�c�T�E3�3�y�t�� ��S�g۷D��bY�XDF���L�J���اrЏ�Bm�]y����1g2��̐H0����G�_��ɻ�^?�Q^�I(�/�` U ږ�!Q0֪�b���I�;͍�x�dP�������q����O�?�� ���!c7A��aWm�	��V3���\��W�����jWv��
�_b۰��}�W��/�*��s[��t�M y���ɇ� �x>|����� 
*  X�Ԡ��!��O��,
В�B+�LUU�x��BUU*J^G;tа1@��]<����z�-<|[8x�|��+-,q�D2�Kfb�2!]@�1@��S�����nF��~�cϙN�~M��Z~y�l�/�L.5i�ߒ�巖ɢ���+��Pn_�}�`��ņt�ъt����*ey�\��4�_�1T�g<�����꧳�N^z��\t'BD�"DtH��~��R"�:(�E�"��F�� ;���!�����/^p�.+����L��Xm�dV� ��Qq��
K�f[E��9�t3�&&)#�9�܂�k�B2��z���|R<�0\L0����{����l$o{#�®��lN���5�;�I1�e~���?���Z�uچ1�i�O��'�i+#�鴅I�h1���� �}7=cB����]ˮ��@�i�@�H^�#�¶��l4̩�Z�������YJ�t���,�k��x�,�J��N�澲�e�k6�&�L��f�H��ѩ��D3i�6wg�3�"���⟏h62d����K[����������=� �T�L����G/�ݸq��vb����7o޼��k�W���q�5�˭j���s=q-l5$4�L�G���`�5�?=�/䶟��-���؏N�#��F3������I���`in~�Փ<���D�:�1\��)�un���2�	�!>|�2H���Il��uĆ"U�^'��z���������z��z�p����p9�T_D�R&���2i"����I��So�q�@�5�L�Z3�f&Y6��L���?Ԥ�?�-+��+ŋ�:m�.�ܞ��g	ݗ� \A���[\s6��`9-���8�.?j]�Z�l�\K��ӡ��IzW�G�:mE2H�m��,I�����[��&�7h�i;�.�s�}��X��垔A�ݍ�� |�HX��1�&[�g��%6�4�?��.\?+r��+/e�>�=���&�^���X3�-���I�<ɍ<�9ح��ٵ(����
L��H��%����|��^��*U����LVV�ϛmž�R*R%��{P=�Sk��:����*�;'�l�t�jr����캵�3������6_�w�NtI���4S\/|Qm �6[6���ѽ�-D�[k��? 8y�ͼ��^Ug�n#���Z�t_����f�j�Μ��`B0Mznq�])^,����h���6�*���y�<|�຺�r�`|盛����]���0�J8����a���E�}`�	t��`,��+*�@Gۉ�wgQ���3!�Xzk�����_w8��p��8SA\O�k=q�j�Xra.���d�!�0��7ˤ�˭L��4���s�?���iK�x�fR&k��w\��p6c!�ݱ�(���o�q�=]xW&L�aS�aÚ��p}x|�7*╻��k	A�
�4�ڢA}�$� ��~��*�-Udm�!��%��f�tN�Ǖj�CC���k	�V�ܕ�71�4y�6�ȋe�H��U<�Q�X
����9��ңi!�L�����Ȃ!��X�		��:S��#v��&og��� ��N74#�����n9�4}6�Z��`3�Ȩȥr�������g�O�s��aA99�=98,�!���(߰�����0lذa��jԨQCV$v	���NW��ݩ���+�˽Jֶ�щTb$�����s$��}�2MO=J�N=�n��ͭ�K�ŴR�m���POW�(��|ɻOvך��i�G��xc�^�)��a�'��F�ѼZ藜2 �0Tw;u�c_=�%����j��1�G��C�4QM�~^�4�N[ZjT�x�gL��.��/����\���^0��x����/��3�a��� ����~pQ���;!`�����P����ʂ���I=�Wٛ�B=U�\C]O4l��{$4�hr��>M�����Zlf{,���b��O,[cI�է����Qܩ?a&�D|�Xg��XAO-�/�S����<�F���1�H5
�F��6����(��C����$I�1�0d���@I�T%{�h������'*(pUM_��ߝ"��@W��ߒ=t�"�iOBt#�><�s���kVy&�/L;7�]���7�vڰRO�������Q���O���_�4��W�]S����3�qͼ58W��s���Cf�Ą�1�赉�W@�p�t��_:u�P�˘�v�[� �][W>
k�
��(��X��uEQ�;Ub�f:2����_=�?5X+ K�I�;<����'�J�1�� O�KÛ�p?^SZ�wMp2(E��>�O <! ~���ߝt��%Oϥ������%XsY�?����9vx����>��w��hmѫ�R|�\[�e��ve��zG`�wNu�I"z�g������il�`dFt6���.'�Y��#z*��$l��$�����:m9��>�d"�q6<���wr�x��onp	.��K�r;���IFΆ�2� �g�<R�6��i薿�N��@��q�m�j�H\2ï���R��+��2��O�X@����\�2�^e�M=F�y���9p�f�b�h��}���h����H(�/�` uV j��"O ت�*����I,����l;��$Gp����x�
QK>�M�k��P�h������.�y����q0�f��{˔��q�3e�g_5���䃪�IH���"%���S��o7k8�B=���"����ν�go�nϑHI$^�GK0��0��F���iJNw'N��'�QSԌ�dX�&��}�a� V��t��%.aH�jP�.eؐSUUS�E��Yݵ����t��f��bW
�S�6��i���Ӆ�w**��꺐v �~����Y�����(V\��RX��:t̐��cHNYA�Z_b�� �$���(&��@1��
&d� ����TA���a�4/li���bE�/��7|rc�F��W!�(_����J�������~@���? ��9�*I��v�y�&�o�FLMҮ���4����3�љvG��驨����ISQ��^ݙR�kw�ݠvxv����ʀZ_*��N��DΦ�*Ǌ8��"T����#����y��Y�O��ɟ���Q�'�O�F����',^S0�=�S��>��,ySq���m�U٤&��F�4��(M�8UO]��a�@�?�TO��Re�g��6��4�4jj�uJ~�.� �bw5��y!�0[��P�["f���DB @�Ù� �H�
�$�2���R�`��釾J��6tP�de�	f����)�]k�js$�p�;�]���~��c7z[K�oA~۫{����P��A��D��R�8�ٝ������=�*��b�W�e���5gs��J
L=� hn�nNh��P���!�%��(��L適��Ë�&�T��ܫ[��c|��w����9�<���{ޥ�S�)Vy��J�^,f�429BC���ʗ��{�"��"3�ڊ�x�Z���I$<��n��F�R6=w?�q)��p5�`Nj��6JS_�F�.��K�iD�TTPޫ�o���4�F�QQ~�܅�΃�"Ǌ[<�f~��}&�I~+6�_��!�^
l�.M4H�	�H��l�M۴�6�l��M�v�&\�p����X�it��&�����SQ:�^]��W�<�7r]r@f3��1�;���?0�`~���"�QK���7)D����Y���~�G}�xM'&� "$� ������O�$dH��r)��3l�(��-��	G���Yp�	�/?����'6�\YE�� C�\ŨR��T���*!P�!����z������ZS��@���䃗4��mT��h���4��n�����ӰV5*4�̈́6*�+Ӱ^5�2������H�n����D�[AN�ڤq��t��&EH�7�θ���a�l��6�B���Z�ث�"��/W]5q�;b1�wwa����0��B,�lQ\�X��C̥��V������Oo�襖����5Y�,Y$l�멪ǌ2�UU9"���"�ǝ+\Ĝ4?Q'�s�x��6
�I�p4ROө��G��4oA���0o��v�m$�|]��j%����4jB=�����I<ǊD|t�
��B���3aC�(l<��۱}���͍����Ww<�C�R�l|	p��	�>�����k>z���#k�w/�\k2�ˎ	Dy���m�2���c���?5m�2�z��Օ�0��C�1�}ޔ�$�8"��
�M�2o�tI��7�]�AN�)q{#�B%
1���v��Ğ<�9���@3��WlʲNI~�a�U����0����{uQ"u����Q��U�KwL�"�>Hp�������CC*��=�+L���E'�����ٴltnԬ���ֈ8�U�t/�Av�	c�!-�b�$~��]���G�E�C�,���Ğ����lڪ@U=sA`�M�M>��a�F��Fe���W�۫�K�ꦹ�H��� !�o�@>�Ow?�y��2J��6T	!+.=�FZ;�7
{�&��T��A��P=	�uəv#���}��������J����__D`�>0mK�3��>:9�W��~g<���W�f�
/$��q2b��K8A� �Z�X���z�m�o���䓽n��&{�|��r��~��g3(pp��q/d�Q�9�zZ���i����](��󻠼���E��¨�B/ٌ�@��16c]Qr���I�Y`I֋�@l� ��ǒ� �${�*��� ;d���w�@Ұ��N��4Lj߮M;��<��(gEfDDDD$I�6`����`�R��4�v�0JS�Sq�����݄��a8A��^BY��n�W#�HB%�b����f�եKG�V��^�d�(s���e�$o`]�����a*��X����j:I��0V�F<%��ٰQ񛜅�6l�9Rg�bzG~p��ϓ�-��9����A<���2 ]$%����E�=O�eR���+f;�&
�V�[��1�Vj�����\���Ga���CHI��	��(�2��DP"1^����I�M�jH��y���8�j��������	�id��bY�}��.LEK�M2&�o���1@��F����o���騦�E��4m5�&���TW�7��L����oM+�px9��t�X$����Z��p��:��J��%)��^י�&T�t����A�%���d�}��S)M�����t\���)n,���M��ġ���+lI��uI��F6�u~����8�bQj%m�X�;�X�{���	z �[�c��b�% ���H��A���(����c�I(�/�` �V 
�L#O ���4�y���H�b��t�m�\0[US�?�Uzv��m�2�T�w#����}!'�V�����7�_�G����O{3�r�  /�<�W����f/�^��|�C�����[е���>}0/`�����%I3����iU�aɘ0�iœ�b�U�Gڊ�ʰ�8���}�FNMkqsf�����q��v� +�q���\ &f�4s��U�+M<t4Dc��̉�0�Y��e�����RӒ�,�i�����.��@i���Q�	�%#P��t�e�ۉ+Mb�xb!*�=ť|�WNSH}_q�Y��E��tU���}g%���:%��&���^eu�͒����>hGe�f.*I������	A"N�t�<#�95�e(��2Ɣ"%M���U�(;8.�����tW�Fbw(T�M�@6�`!�������?�����}߷0�j�������]m�����C����=C/�TJ��M�}t�un�>���T�",㶨��t �ASÌ�zD�����G���e�|�C��$d��8r	�$=F��)Rh ��Ȣ.p�.y\QT�.�.�xt�,�%>�KVⰐ�+ߙ�D|�p噧o^��jf%k��^�[�]m٠��A;�������YwW���^<c4qI\�؝�y�\aiϔQRMS���$L��%��zNK�e:�dQW�(��v.o'd�PH�N��OBo�p���J� y�xo�c>���F6��|���Go���a����oW�d?��Gz��D��9����M�.�-��F*��h��)ڒ��V�e#�*Uڊ��.��fE�tB���Pv���/��^��N��A
���d^�m4��l4�@Z\^�ؚX*���(���`F�C�\�Ť�pC[�!�ݗcN@����/l_�@�СL���4���$�$1l,�I�B�9n�5�ґ�,���Wt=�0�E�G%�EW`�G���.�����#�lMS^M�.��		�D8��oƀo7_�7���8\��B������]|oqX��i��a�d��8L�a4�w�������qpX�}�M�a+����uT}W{; �hUpX�=��Q߾�/�\��W���m{8�÷���VsX�֗U�{����ۤ �6ix����[f�V�����/�D��;�"_�??�c~�t�l���"rp����ל��_ݷ��:��N�B���w��U���eu��u�&ׯ49Al�$�	�+P@�,0킀YY,0 *[bf#y6'^��T�t8��&r���E#�n��bN�.��7�[�C!��ly��*�p�U�÷��v��3��j���t���B|��&������h8s^�����>Z������]bk�(p-b��d1��d��vA%MV,�N��-L�7��G�"Y<��ߨ�OD}��O߻g�k��6�H� w/M{]m{=�SV��9~}�����3��?�g�^+Xq�����"�y L�L�(��P<!kdB��o��j��ͷ�/�z�Gү	Ŝ֛�@Q�d��\tئ�t�ٕ��\��̺�-���]m�����������7d�-��	���Va@aĜ���K|���Ĉ
<�(� F�%r/�+���Hd>�+��wt��A{���雯�v� ���I�`�C}���!g�,�#���A�!I#LASSMdM>���Y�]mM^W[^���y�mk,�D|��Nr�pBM9l���&֥{b��|�K�nʘqcFC!�J@9��:$�</�q���fq�����7��|�~�GN6�?���|�@C.p)�V,IcH�!hf���DܗM|���J����,��+o��^���~a��^��''�?�������N�2���7�'�%NGRU\W�"6����!�sx('B�#^�H���!VÌ��2��D��o!��E��-���J�����g˙���W����fu��u����^
~韜g4����%s95&�7oڜ�>��5��#�&>rd��ݼf&u3���;�:/��m>{��j{�v��������w��� nx�� �Ԁ�a$�̣��@��6%
oͧ��qv�"��'Ncz���n�2%	��^����h����O����y�H�y��Gr���+�yT�@n,#�S�q�l@�SN����gXExe��T7�Qr ��-�%#��	�����	�L|�{�{���]�{g�����稡$�TDDFF$�$I���2`�K:K�l�{@�a �7�c��pq�K�kH ��l��.�Ҙ��jWf_k%�B4�<��u���=��d{��I��`��x]��@��3qnPy���&C��T�����gd�B�ҧ�T�֑)u���%�!�I�=�����},�TMc�z�)�<T���]\K�Z��9�P�	��X�fl0���mTX������ej��Q,�&���ҋ�E�8�����Z�?���}�����0���f��\����]tvTR-�ZÑ2���
�[��Zlz6���Kz��"}��Bk3��KG����*��N�:���j����Av]0�kǟ��v!�� %7�t�A��;P��d��[���J$p,㿋p�W�����^,�@�m���՞Vn�P�Hv΢�f�m�`y&ܒbJ��������|>�Pb����yC#n�YJ�6�Kz8���a߂f�����Uu�DW�ԵG�(�/�` �I *{T80jQ"0]l�bѝo�u��[���)8y�\�� S�S`C�|�Ad���l�%DʝR���@� W悑.�06��_�_��C�wOq���h��I��[g˶l�^})�tS�U�jW�{����E	�<<S�&L��P�"��[�L��fj�Y6�4�-�$�\j"�bL��]���bu\�C5S��{�;T��y�dfi���h�m�_(4K�7;���`��c�̗𠺍ڥmw[Y�o9+�/�)�61�mjߊ�nji�@_�{�}0��3�t�F�B �t�gY,�U/f�Cu��{��GH5�E�����Ŭ���Fuhv�߲�����osn�}@���a��B���=��J�|����.)����v�������ٖ�V��{L��P�HW�0�UI80>�t�A�_�Cu힗��W<	sN��d7�i�Z
狭�}g[l�1ϲX�� �~^��,�M]�$N!�N���9Nٙ�O���i�T� G���@R�KXy��*��4�W����խ��/x�����Qyi���� aC�Bkv�i�D��'"ѢŉC�(��=$A!�u�/������X4j�k~����]�Ƣ0��D�9�1��1����$��Հ]=���R%C(/n���%E�|$���DU0��(ڦ���r}R�x��b�w�2�5˲Ȝ�+���Q�_����7 ��?��V��u%�\��t���7��� �P�n�q+�kl*o�Λ>86��{/V�i���-].ɜc�o���-_�I�W��0vW��$�`�{EG<=f�c9To��+<uO�����.Z��.&�������*���	��6�y��(U�N:X�q��n���Vc0��R�)%�ί/��G,�G#ѧ\~��E=�,#s�d/�$ �\��[_��5��|���?+a��"������7�*�F��.�v)H@�8o���C���-E�r�>��-�E��g�3�gȹ����Bd�I3!��ZA����j�~�4��΄<i�F|�X��i�5�����J�ݞ`B�Υ�L�)�__�Q�5}ufW.�� �~�I/�(rn�M������e� ��&��<�^���h{��/��m��t
?S`�)�|`�G
� L��_��,6�@.��-����<�p�Ȓ�(T�C�(�R�9��/"5k['۾�Ջ�~�P�#���EU�Gl����y4{ͣ�1~�U��}V}1f0N}��7�М8)�V��[6�{�Y2T���_<)��;6��I{����g��߾��Sz�-j��R�3��?���p�1[\�}E�4,
�����	���6ٶ�9t+�T���C��n��5��U���A5���絛�:v�BWٲ{��e������S�n�yD{��`�~��j��_�ӟg��dȽ��^[���H���&�LsZf�=?���0�e��]�������pѲ枝G(����<�;&��*Xn_�ϲXO{q��� �7����)�=)j&����i�+=���$He�ag*E�<�����x�P����F��϶�7��Eѷ��l��mQ]���:��tZ��{/V��_��׍.��o����-��<�C�����w2nę{j��2,�;uZ!E��xݫ ��ݾ4h�/�&#Z�˒>�,ǣO�$k�_`M�����l���k_���&�q����t��N}3��Ԥ��M���q�t��l�<<�p��vO�3H�R��M�)x���v�d���f���˫ȹ,�Fc��4�
���SLI�$�� �$�{ �2�1IR�B�5��h�@�\�YTVl��;<����7�V}m	�qY��R�RO
��XpC��IoX9ճ�V���J��m���tCRc�����X���WC�L��NQ�$��7i���ύ�.)���WD��˼�ͽn7�F}-��#����d�N� ���1�)�{@�}�� �N@]P�g%��"�%x��ړ2
�M�=.<a�vO��h�nWz_�{�����(�S�lJ�Qat�{�p1S(�T�)P��B\�qj��N��+��@"�!���L�R⽪������a��m�
kk�Z�+�g}�5�4��~3&-_p}�'�� p�%����r+��4k�u�Ȕ���S��L?ۻ�Vi�F��=�p�@R��Y��ӋJ��W�E����(�o7�>�^�Tّ,`��ejf))Q�y���)�A���]�"BEԁ�b�%�)M^�p7���Ձ�0�/d4�9�=V¨�"�	����ĭ-
KM�� <�b���!���R�. ��0��rS>U�rz����f�����M�8�: ��&�6�>Fi�r���� ��L�)(�/�` �J �}A@hqj��hD���-��+��5��=6��v?wd�m�Z@����8Ԓ�F���ֺ�����$&{'���4�4�ay��Ѱ�s�a٩H`�Al��1��HP!=EO��'_�{F]H�O�~�ԋ��k��m�}�n��Zg����b��4n�޷��vG�q�n���$���|��ay�Ұ�:	y�r7�%�z��hF���Ξ8|���L����{ޱ����%IbS=:7����mj�Ҡ��z��V�
��m���1I��H �W�7�D�[7}3��n��vUky�����z+�kK�r�|��3���~m �\=����%o��;�Nw���ʯ�'kP:j���JZ�[=��.����1��SM5����&n~���Ұ��hX�1-�u���K�����%W�eI�����N�[�fUN�2�m��֫Ұ��]���~�.�5���%'�{�ؿ7��Z��g�7esK�c����T|�c����9���^��>qׁN��\�P��佡����N�:�2�r����nRW�J[�2���D��R�UE�4nc">�ԓ-�`�D��G�.��e�Kò�4��8���o�^r��6���t Y��F��{	�7��Ԕ=NL�،%f��0��Z�O��|�?"���:�$����q0��x�q��t�\}���_�K�ZH�������^1��K���1�����w��1�5s˘4PWv0e׭Y�ݥ;�
��V��M�{��� �߸��@i���3�[����^�c��|��cK����7>nWdՑ��o���j*H�9�2�rnFsu77��YTHò��D�2J�2
?�������.�� D[||��u!����OA�� ���&O�$�b`Q��fE�OD��;it(���!Ka���U��ʈDZ�(�16��`P���I$�H5Ռ�怖f}kQ�
��2zê���|���^�g�J��A��鈈���	u_���P�%��kt��8%�qK��,;7s3�n֭�|e�,S��XvM�DY$��PfQ[��%��������u�3�������m̷��b����a~~�n�֧�HW�B�t���LRM�Mveuss��꬛wS7��7�������3����F7�^%���xђ���)�-R�����W�v�DK["��X��T7���Kk���e];�i��&�K�kI�ܖ���������Ξ���n�ѥ^Zsm��"l���������F�r�q��Ұ�Ѱ�kz��k��Z[_g�s��8�g?E��Ǡ]2ļ�B�������[�K�|�Y�3����zL%�~���_S�ɮ~-�ڝٟ������K.����v�Y?E:�'�eOU���'��Y��կmzs�������Jԥ�ey����%�F��+ePq5Wuo<*L�KO�~�����h����ӶJ�D�^��m���۸��@T9-/�W�v�,T�{giI׎n�:Oj,6s�:��LK�
��{u	2��	��k����B�C�3T)���@㗒ZWu�ؽ����4,��WS��^r<��n�����:���Oϒs�6@�Xfe��z��������x��4,���51�w�/�9�%7�6~L��F2�"���ZVQ���$vo/����G=��5ږ��;��?��zs�8�n�[[��g�.'hEHbAcƬ�b#^L��y� �A2�BEɛ`!J���x
��-�ZHr�Mr�."��H�(eu<��j?�;�S}�k�C�V�0D�D���{��!�D�Z�+�-�c0Ǿh����b�V~ѭ���b��uJ��R�����!�RI
��� ���{�d%Hs�!&)(I)��/��HY&z
0~F�!�RB$�>.֫������o�y��#�i�a��W�|��<~��� �ӭ�)5y:�j���p��A)�C1����)�uS����$d89b�ڞV��D�ֺ_6hl���B+�9'ܮ(H��\#:�����
��i8.�a��՗�0ud9�U�녎F� ��ƛ�o�f���t���D}i���w��X�>��K0B��;5�E�����'��)����:���)����bH/�3��tGQ�!гP����u�kd���h/5�ae�Rs��e��,������P��	 �|+s"z��8@���q�˃��^�o�?�~�c|⠍�`c���m��~�Da�>�g�a3�x�a3�8ɋ1:�x+�q��d(�j��2�ct�՜[ןg_��&8�}D�`� �R���؈Fw�Q=�it�'^yMa�u`�����Ǌ�7~����'ƀ3�uR�,�`,3:���ǜӦ�A�����B�=m���7����e5�����V�ݻSh"�b�3�D�H�J|�
�	�)m��q(�/�` �Q ��L O0�Vu*�e�!MQ��0Є?�a���*"��Bd
�LL�6�.b�ީ��|�h	�c
�Ý�"2S�&�zTk��OZ�R���i�c�jѴ�M}l�t��N�Vr�c�<�����$�X���r�������@|�#Γ6���6II�VX"�x7S>���{�-D0vMUL���f�A ���O-s�K�xyZ���,Y��Ίf���Ϝ�Kw�cV�Kgl�!Zs�p���բ�+֢i�lѴ$Yr�G����s�W�J#�!T��v�ykl*v�*��T�ya��$(S�ͼ)c��F��mS{��/�Ė�@B�V��ON�Y:���ˬ1���5�����o�i������k��w]I\#pq5=-�+G��5�K����t�u�.��ԥCsi���4�HD1�Muh-�҆he0m���*��f��w ��\�d�Z���E��%[���+��w���
�3�r���9o�rW��p�}10ꑤew�dS]�Z(Ґ~�=�0Q��Mn4jlV��g����e^s�u��=^�%_��%E6}�C�Rd�4�(�h����d�HD1�ES��d�h�b�x8�AK�TP]+Qa.v�b�aGm6JjȬV!����z�l��҂֟k̙����ޣr�϶�ق2����aӻ��Ӣ鎎%m=�M/��sN&�R3,������}<#�pg�R{I���4n�1mݖ&s\��{0J�a¨�*nQ!8M��s�>����h��Ug�Ěj��#[�lIO�V�YkѴv�0-�m�C��8l��oSd	�kМ���V�Me0�,�E�X��0�V�.�1�e+�{�#�ի�u`+��!���x+2���ǋ�xv S���k��]�Z��Yu��Tk��i,yc�r4���\�\�7���j����h*õh���hj#[4%S����q ^b�OG��V7	1�n1FJ�C��
�&����̥���#[lpdI�,��Tv[�ۢ�͙���e�;����.A�O��)~��<
p�"��M��e��%���.�P��7�t������+s�U_к{�ǣ��8�^�ڹ�˫�9mf�=���Z9�L�͖�7��[��Ͱȯ'A�ւbDv�X������$f��TH
�q��'e��X*F�h �~'�8��s�����)��!��l��Z3k̉�x�g6k�^��iS����{V=ڒ3�%��a�"���xn���G'� x�w|�Z��o�98�l2cx�l�r�6~�� Hr��KVN�ە���=��̵/�-�5�x�@vKV8��!v5&'8�UR��:td��@�qad!2��<p.�|���N[�˟�nՙ��̹��X�$F�E�S���9���FA�FB*�+bo�0M~2���":�5�ۦ�U.�E�/(c�1�_d��Y�����(�]v���\����nB��M���Mx���²��4S����͵��Kt�K��w��M�U�/=�s���.[��/� ��1?v�CoO�Ĉ �E<�iꈌ56���	�@q�a�4hZ9 �/�D>�z��Pp����1��u�^CyΛ��ͰL���dbNC2��4ir8��	��2b���>�E�3㔦kņS�Wq��|[�!��a��p�6�tA�<�T��gUW��O]��Yc6�y�f����$�kI��3L�>o��ǒ�O��l�ƒ#,�9lp���߳�.���I����]���P����
|�<H���]����1G��f�z��j����1I�cǈ�ES��h)�y� v/b:r�)�X`�ɂ�g� e|"���%4ۦ)"��_&!bF�3���
L^��&��(��)�v��@�����ݍ�<Y�����=˜���{�8��~:��,:yO��ĲS�zP���$�=X��<��ҫ`%�OA�G"",^��8Y�,����"� ��#n��#F��"%��D�6�#w��V�z�y����<Ͽ�5�p9���-\��0�X������1ь!QFlI��qx}�V=�o{'m4y���-�I��#�@�5I�b� �c�a�}��wO��>�V����s��HDdd��p��*@)BٌI
�
c�{7	�<D����M����#��|�&��/�o����(L7+���Zϲ�R��/�+�-HDz1�W.jp�>�<�:F^"�=ve�'G�E� �hw����|F�C)A����K92��Qõ4��c%����K�ڼ;
�C�F��	�d	��W����y�����u�d���ê�� �C�P��1��������Eq��·�������:�z"��:��E��kӘ�T��ȹh&˟V=�z�,��6�����`T����`钏��:��	�`��������M�PXA,"�1���
���q}���ב�������aɶ��_�S��|����B�/2�c�.s�(��Q?ZSM ��ɉ��5_3%O�s���*Z�rR�d��Mb�qb3��w`��Dt*S���PE�`�-E�� W	�(a�C��L+�wfPLh���P ~M�iU�
7�ȅI����!�_��%:!-%��-#<��d!e���T������(�/�` �U :��!O X�4^c��б��}	��<�@�c㏍�-�)nӺ�-r��<e�V��(���	7�R~�o�����T�F��v�q�g�	�)�n�r1G�
*_UF�PA��>�8&�M�������_1ɲ<���e�������W�v��lo�-c]�,�(���fY+���L'�!�/;­le[�nYv�Y�(��XS�|��n�]L�y���h%r��y�X�)Jw#��I�F,%#Y�:	X�* �WT0l����l��&~���w"�qb�ؕ�rs� E̤"��џ���s0�p��گ��;�'"��7��7M����ע��N���X"8��涽��ad�#�HM:OSK�"�[�.Ҷ6�Wm�Y�Uۜ����{ՖGGʾj��*'�^�e�������{χ��I�*�8ݭ�t�"FH��F2QcpB''���O�#�|/��t�
��}��	9.b#�� 5A�Ųy���+���cy'�q������ر&	L����nk��C[۶�*���t�����a7����]��dkm:Z�.�z����lk�_�:���.����ZUC���n��4����������J�g�`��nY}�競�~�V����>a.��B��D$��p�[P�0��QrU�of���g�>���a�WmaA7%�������=�U����Yr2���q������C�Х�2U� q�"� ���;2x$�;�s�ofn�����ؚ>3��3��o����!�y�C�s|��2u����U�.P�PQ��1�3xZ8��U�&�|��T���{�GTg�+��l?ߩ�'�t���/'�=w>a��yH�o��(�f:G'O���,�JW�����%^s��b5UUX�?��uȢ,J3yv�"O���m�X��m{�6f����QMv���۪%�,3�N�8�rdHG��B�x2\�XC[j ��Z��Q�D���ڳ=�08��X��M��#!��;`��ܫq�ͪ�:$����g`"M�oحG���V~���_�������A�"���B��_����$��h������^����^��%��xE9��e89C�s���y�Q��9ؼ�BN ��	 c��*Ҧ�$VLn9���/F-?�`J��Cj�R�%{����CJ��􆚽�����x�ю)����^��k����=���F�	�5v���F����U��f�����o���鄿�G�.U�J�0���T`)�0F�O�F"�:GY!k;�6���<P<Iĭ��[��q�Ǳ�:��@�ȋB"A���$RP�Ic
�|�(ᒭ*�%R��91�ռ�KoH��lM��[�E�Z�}`���9�'��gr�%+��̤6�y�n�M��1��IOc��U%���5\�9d'#��;�u?���+�9�M$�J���H��*���#���.b�X0e��}%�LA���6��5���M8D����C������gt�5��6�P����l&wۼ��Ϋ�;;[�D:f�9�9C�s$�������7�~��7� k� JR�.� K�� ���*!T��֗�8t�^�)b��xIQ�%���C��>ݫ�>QvƢv5�n7�B쌸���z6���!�;�4ed8կ����T���L��><�{)(�86�(�Y�*���Ef9�]H*A�R�P%[٢DI_�#d.;�Boի�l�>ګ}�^�)��0G�e�����c�d��%�L��/����Ep�i̧݀� ��ŸaP�U�*#ad�J�����hƳq�o���Z����q�)F�2�O�L,�]�X?N��o;ϼsނܔ*ݵ�8e, �`ܰ2F ��X�g�'x#�ƻ�˸y�_?X[kk�e𿭹���-P���	 s�r��&Hxh��|�E섴�8�1)�qV,��"V[*"�2������i�n��kQO8��VwCm�i�|C�&]��'q�����ڒ��@@���<��t���W���=�1~�� |�/ɑ�c���:eI����G
��@�)���I�&�%;H�~�F�p������5�~��������U[�ۭ�:h�K\ȵK�nY��	�A�4���@ 8)A��FD�Ԉ�/j�_o�))��^H ���+o��6*�H���W`���~@@�
-[� ��$��!I��p)�P�b�N�$;�7�lw�K�fg��G����a�����=&Q`7���3jܕ��TU�d�[���o��i�j(Gy���H.�s���z(��=�w>�pG�'�r�y$N�@ k)����cc�f�A%N#�N�'	C�,���u�3�U�%R��l+�c]�[}��a#����~T�&=�ZIR�(��-����bo�ǘ��h3ɷ	��=��V!�y�-W
��O���6f*�h��^nQ���kB¡���'�?ЙTr���c+Т �">[@��0H��ɡa,!�d���׾��'pΨA��EU * p�/� 8��P�Q�Z^ՍE��!�c1XQS,`��K.�d��Q��0�����w� О\@��e3�Ԇ�*�g���2�iG�U��\VX}�@W$�iU�`�{<��X�����6 ��ݡ9`K�m��K�v;�����1A�/ �?�J�vr�"du����?v���Qc�HܜX����ݠ�"�Y*~s*�Lz�K#sF����L��8�V�BhL�.�G�(�/�` %T ꓴ!P �2��#>t$ ��m�,��g�JOj�01�F������w�A��gXI�N(��M	o@�ƶ�Ȗ��d�T���Rn)S��
eT	U˥r���<�v���x�3ʫ��R�W�e���K�#2�H)ɀ�VF���
4���(^x�O�C"��W�W<���uB��s��5�}������ۮ��Q��f+J�6�撹M�y�`�&oM~���&�C𷯽%�"k����`��t�J�m��/�n�H��f�^apg�f����}���&����.{A؂*wu� ��%����"nW�a@/���=�08c�2�e��%��������|��C��?#a���'n<����5q��U��X�|8@o�R�|��Z����EEGĢ�G�rf��rF��PZ��/����1�xO�#>�k���ر�90�s=^5���z�%r�3l�rU3,�JQ���\U
{��+��#*Y[���OJ�_w���rw��˝n<���b��x�M��c������Tٗ�-x����J������2����D�N(1s�S�zU��YN��kN���HE�a.ő�QO�7oi-e<�� ���01zw�6`�{���0x��xn���|1�
y?h+�� �5�4�$	��Bt� �~&��#+�R���T]�Y��5�Qޢ��Y��AՌ��ڮ�j��t,gU3�Y��v��*-��4TO�q��/�L	�D2m�`��H8N���w�V(� )մz�]3WR� !M���X,RM[�&��jf�mk|�xk�Ƭ�F������ӏ�}�`J�L'3y���GJ
N��E%�>%貱�B9$z�3�li�g�ٌ�3�c��aV�����u;�df��ž���#%N����tn�$p�h*o�I$����)W�G��,������6�>-�]r�$���=�7��������ּ�Ɵ}�&�W�N^���$1$<��&Ph#��h(Yg�����
�$�@!��W���"�a�W�~��r�V�h��4*�J��R�S^��6�GY�*'���A匹����rgӐ�;Y���#m��$o{8ZCW���hɷ��2ne�t��ڲ��3�֙^�&��# 1�\���]�h�	e6����c�����!�����V�W�:W�2Z=�F��c�	f�t,W�.�1�I��F��8O6�݆�`���q�̑l�ǽ��Z����Qc|u6�Ѣ#	!����Dp٤�1FpXN���� �
7%���ޫ�^�<�.˅D��t��#"��4�(������ƭ�M�xl�nۀC6��ֽ�n�t$-XQ�g-p��8�����W<q}�F��CN��4]-��n��+|�k}u#�:�{��<)�}?"���B�!�#b�����@���YQIC�u�Im�mڋ ��~�&�s��Ol������GQ���u�Q�!����??��ԇͻ��`*����	�OJ:��b*|�&[w[&��˃��`⇅�0آ�II7[w{��O�?�k^-��TǇ�c3��C�N%7xa�$CD�� \�P`�)&��&F0\l��ˏ��l;[z�m�7����k?3\�dP�	B�����"�o�H�2�դ��䅞�N�@�9gr��9d�0"�չ��r�x��"����h�%M��$0�≜��8ӫ8I$7��Ef�2֠���*_(@������ ��L߯,S�R���z==�������z��k�����T.�.��}���2� 7M�B��M�R��XW�ᆖ4o�ۻE?�(�j������~�S9�����R��6A�Ա�����9D1���J�,2P�!i�0[�t��!��@����"��R��/�G�i�OL����5�i��Rn�xX��TY���S��~\� �K:,�Q#	HR�K��jS��q�q�a�����==,�z��SoO���Mw#_���m����G�N�>%���l�lpD�$�U��#�@���z� ��?���#�����[���c�ӮY��-[=n]���M+c*(��p�0\1c���Qӱ.	��K�
��EGSW���h"��Vy�P	4U�Ŋ�t+��8��bl��}J2a�T�#|n���E��x��b�\0��Z��^DLF��2P�����$��3"2""""I���� �1	J�&�a�ϗ�A�_�ѡp�B.�[�w�&� �Е�綮A��@t�t�G,s�5ڂi+F����lj���3�y����P�@�ן+a�]�*)��{�#��%�3�2����A�D#|� <֌Q�c��njs��C�Q���fqw���3�# A�.���ԟ���X?�$NU�t�7l܌�c���P�k4��EP�ȸ�6p��6o� ?�ܘ�n��Ku�*D������4�jN�����p��� Lڄ��<4�]���D >�����"�v�( �T�թDA �0eD!�;S겒J,)�1KzC¨Mz��t)�����$\�}�7�-?�@�M9��4M��#䑠=���0���|�2�\@�#���:e��2�Ԃ7�P�<
�����:��D�P������� �_�5J{A��o����<�<�TY��R;�]_ޕ��@�8����3�	�Z�:��8��Ǵ�ᬀ	�����,y�b;�Ns8`~4-�#�Q�*(�/�` �P ���Q0V��~&o�Z��圶��t~,x�7�����;�*NRE���g���=
�.���ӑ��oO>pX������n��?%/��)���p�� ��:ge�J2�W���E%>*�	@�膬>E0|���	l�,�Q����%F'x�*Z��"h*+X��ē6ElY�e+2���`�};�����D��)PL�a���;¡�NO��*��?{zA=�ѿx���@�V���h��%�)B�p�(�Hq�`f�aV���D9ɡ�aE��Ld0�!���%�\��]Y�d�u5w>�[ݘ��}����.���;�qU�Ss���G�l�O����4�����KC"bw����>x����¡.P.��_�j?�U$m���^��YMo�]���ߛ�1�W�������&y�>������]����<�!c���c���
0� ���J  8� z�*�o��Aaq�[����jJ,��*$��L5G ~�����>S�������?d�S
$m ����.��l�)?��=��|i�H�ɑ�Z$\�p�|���6k���3o3�ɏ&��K#qB8Ԥ�b$"�	����3��O��J���͕|���~f�	QR���i�$�t�nvs��ph����Ϙ���1d�/�
]�Ԩw�j�nEe'밓�D�.E'�:*ɒ)�D)5=JV/)4��+M���,�c���x���)��-{�Y�hQ�:��me?�m���
�5����N��)å_ ��8s��"F�8KU4��BIg: s&?�I(�1C�%#
PÆM�V�-s���;^�H��z� ��+?��r�w���F"������N�}�n�UȻ���6�>�Ι-o~/��IZ�������7���!��2$w�x��7��ʏ>*ܾj����Y3��͌�#�[�(Ǒ�x�|�,�b;6W��m�+{�n����������"n_4m�]��|2��߱6��w���0�d����o�S��<e���d�C"b� �f�����?��e-TLGt����`��/:+�Ġ�4���f0�m_A`I��T&�0oP�ԡ��ؖ�oN���`��*�̢L��A1ݑHAZ��&D��dL-9Qӵ00,�fYM�E
��Q,�sQ��u�l:p���������/�F;Hz�3p+bx�2���a�>y�S�V|Z��)�"OSnF��\Y1��\+�逆�Sc�WW�{Ҕ���ώ��o_��l�$�,��J1���I�� $��W�j�8E��|�	Ӕ)"L���Ö���$R1�� ���*��X|sA!n�����wl�i����S�����>�8��x�L2��F��6x0�V�2KOo��FQLPn�B�Is�ҕ�0Ep�Ơ�U�|<�Es�t���l�5�}k2���O���/]���>�y���3��D�$2��R"��n�	ӆ�kz[�n�y/9pC�����6]c1���i��p6Y�2�}e�n_�3�>_�o�+����Ȗ*9`���������/Tk�D5$���5�K��$7��M1nب,��<�o��*O�>���:&��h��׹�1�������6��/���9�t3����4�/h�]F�$L�T{Q�F�E�D�.*������o��k|������yAş�g�AP
��5E3��p�bxJP�ⲅ	(=r�<I�!-�D�0z1Z� M
vHaƗ>����b^\��R��� F]Cഹ+s�Z��j�|Ơ���9�*$s2��{=c�8$�f� b7v�_����-ܾ-����}���J�)�G_�o�o~[B�+ai�!?i�6@N�N��I N����@N�4�R��$�]^�C���8  J��%�7��d�ʲ4n_�����<_��}�o��$|��@�� ߒ$P�Tt�XtU���%��Vơ�XA@v5'�ybD�"�����ܕ��3�����ŀ�|���|�C����mu6�ȭ��~N��y���#���/�.6WR��ת`L�E%'0?��ؑ(12XO7a�24#�H7���,��3#"""a���ma�(c��9Ŕ*�$I�� �~�X ��6	���ߢu?�p���Ԃ������E)O��y�Y�I���|���>��kơ����%e]_J'��;��d�q d�?/��*�ZZ�}�g�ПY�b�ry�3���DZ�[�f�ƓKNB�Ě9O�	���*������X�x��#B���X�g�p������h$�n�EjϪat��`��!HJ�W����r���: ���,O�'SC�KW�7�C�iB`kO;��}.� ��铋 �rf D��d�ʙ�e�־z��6�[-�奧�Q�>Gp���l8��pDф�D�5i�gR����jeup�X�{�Y��@k[d�nx��v�}w6As��2�Hԇ�j��[��d���1 ���.u�.?��
�
�?3��83[u�� ��G����o��i����~�5t�	k#��2F���X��s�qT���X���ݭD�0(��ٝ��p[o�/X�h��>2(@�`L�D)�ݼ�e�Y R�'��+T�It~(�/�` �> �e�APjQ�<̟�*��o��s;&��UkO�ċ���%�E�����S��[l�4�N~s���^I�LdUV��ٮ���^?Z~��B
,/�I�� {{�!ə�p�=i�K0��T��b�<e)���+�YCnha=ΨP*�%A���Ge��}�.*_m��	
�ϗ�]?�"Wo�x%�
�W��}�/*�B7EUt�|��T�������U]���%UOQз�x��}��cÉ<�?�p��q~2����+f��
c>������?:�ŕp�ȥU��v�۷n��ڪ�ᓛ�.��ӊ@�����˵��W����e��X��wY�]Ą�l��ڽz�_������7ۇp�(^?�	fCd�	:Ér�����D���~�P�MK�)�4F3q���ڵ�-�^�k���8���v���Ab����S�����t�[s���ڽȼr�vY��:@��x��3k�ˉ3��_���s���C�/k�	r��^j������WI�c�%�e�jj9L�)E^0(�2Utkߺ��V�+�� =ݬ�����zv�yKy�6K�.��O���f[�����&���K��Ǳ���hof��]�Ew���m������,($���F�V1��
��C��5����\��v.�w^=����F���JX�!B�8��m27�"L'�q��t20�����p x��n�m.���][c�ly�L.��P���}����������"q*W��1\�:�tY~��r��,Ou.�u��� ��W����L�^Y�S�PFr��tY~z�<4�B�v��?>��x-߸z�^3/m"������O���?�|����_���=�\"[I�|�G?����Yq��O���Mϕ�r�C?�W�+�����O���%a��ǹ�%m1O�A��I��&	>�Je�6�x��!�lle���F�U�\���Q�5�y �R�������ٗ���<u�ɛ:�&���ο/���粜�rY>��.�sտ@>��(�-��C�G r�"��-�d"�UvX�6�����1�i�/Ϟ��r�]n�j���|~"D��v�vB�E�������m@m>s��6M�/2 ��"

�x-O�*rC?Y)�Hzr�T�����b��<٠����b!�TN"��q&��	�?U9��&b���H�@��ٟ��ɩ�7�� a���:�q���,>��_l�&�
Љ��R ����/3�3���#SK�G�����L.˙(���aN>Z�9����B�n�+@��B�aK��_a__?{a����,��Ef��#c��~OL篴�������y+b`-�|6�{��f������bu����	/���->:}5��zMn��J������&��M��k����r����gŠ�W�O.˟��U1���X;7i�q���%fڊ���0�sY�S�YR�?�,�R�7�5�4"FR�������;��i�ԒHI�İ�_{K0�3�7�2�i8�ϟoq�-5�=B�-}��uX����i���_���P���c�X��䵀�.�k�JS�02�!�5I�	����tp�Οϭ �5�&l��}8Yq��Р�/�)��6����1)�'#�O�7WzBLA�L�.G%���F�+�]���i8��rC_�"�@W���V_�kj�;Q߃k���>�WjfP��Z;nH�
�J܇滰���y*���j&�,�����/z�c��0?p��t�8�n/��	�)�����+ ��?�W('fS/9�CN�c���_����=��DL������M%�� �jC�&�sϠ�D2ЊTa�B���&����aO�#X�n1rL��@����S�N=�Iҥ&\(�^�nZ����*�a�$��`�͓́���TZq���DP2()%�U�}-gڱ��v��|z�j��E5漱��H&�/	g�*ڨJ�O>�)���#Q[z��E���6`�U���0n�����)�#�X��V�z�o�rì�(�/�` ? Zb�BP�M�5�䒠��Ș��/o!EI��%0|gs఺×�M&r��nQ?��?r<!2�L�����y�{�eJWALc��S��|oƞ�b��9zfM�^/k<DaC A�l��h歋�V� vڄm
܊VH��9/��&d���І���@o�Tu(�u4r�MA`�	��e4z�M�P����:�T[E$.����\�9�yD�}.��*�v./��^�H2+i�d�����Ρ�5C��O��f�/�9�5/(LVq0��3=�^���,it��~Z�,���|]�:k��/mo�˼$-E�A���epFA��&k>k����J��#Wׯ)M�����i��:�������=]�Ӽ�iy�:����yK?wͿ�w����5/��9��f���:׼:��[��1|�]�P�Wu���$���D"�O�l����%}BbI�>��icK>w;��]�03i���<�V�/	ı|��N�S�+��Syi͆�o� �-ݘi�/�L�d��L����[E'�LҼ��3�c��sw�V�.y=�k���x�%���p��8�]Jg�&F=�S
��s[,��f�59E���rY� �3�f�<}�	��-(ԩ��tژS�9=>����}R[�L@{�Ϋ��%x��@�:�Y�-S��8�#��guV{8�L0��Ϲ��=��3�v�w�i��;� ܽ��-�T���|o�*�Rr׬$�Ǟ̿������L���8��g?��'�b?�L�.`|�E�T�(\��Aۘd�
߀�\u���ʝ��8ʳʼ{>�W{M�+��k��x���h[��Ė�#�nP����F��f���x`�9?B�jS�-���Q��`Sɒ�ݓ�Ig�7U�é���Ou׬��8,oq�*�������`�����UG�b�ђ����ٌju^2{-?g�2!7��弮Lw�fW��D{Hy�F��i�S���G���"D��˸��~�A��D�zD|y�B��
�4/���!̖[�?5�t��1�l�/VM���٦���������KM���T.O�ao��]�]����!��2i�Β��L^!O�`lN��B>G{�ħ�C�"������]�2�C���Ey~�;��*a��E<�����Tn��d|&ǹS��� =�t�t��a,t>9���gp�B<��h,�%���t��%w��U\�h�:*��er��t�w�*_O��擆���v9,�\�����
x�w���I�P�F�	:�6��Aw��!���n�#����e��L_���W�5D����0�X��\C��2�Ϲ��=�;>��;ӽFژS���$�C9��?������v�(^���S�6&��Q�v�-�����5	u׌j�[�*�Kf�vN�,|�7�_��0��D2""R�$Ic�� &�u �����I�L�oШc�	��ٰ�y*$���|z)�ʖ��o�+�K��:}�����H��ّ_���U`Zcمzl�"
���,&�>F%`�l�j�1"O��8`J1f��6�}i���z3�C�oDE�4D9[L�����6��W�Tՙ�P��)e,Zz�uaA��Y�����������7�`7�\G���_WF+�?�$ڂ��I6yI�x
獒U@�qv�p�<.J#F"����pm�T^%�7��/|�6(����et�����MT�SQW��X����u�@�))�������9�����h��%l�zyK�
2�b$Q�n���v�8���od4�ln���	[�;{8�;�q+3�Wñ68+ޢw��w���3���IJ���^�C��B�鹺t9�cж�x�cUOŊ��ܾ�Jq'p�.���õ�v7���Y0��ʿ��h@�O��'~~~�����-�F3� �,�C�P⦻Bavd�d؟�K���w�0�"�}��>�H�?K�?w��+1�,�*_;�;~�$�v)K-e�Xe����&2�	d��(�/�` �8 JU�Ep�QcoK�<�� ����b�b&�5�PL~A�����@w�3IX��ȞJ�ɇ��D�����- ��J"e
?�� �7�U]銪���t]IM��=�=U4�I�����ic[���)�4/Hc�z�a�1K�S��R�<t5��A�X��P�H��I����d��*.�t�/�̕�&!����V��*�BO�s$G�gTqy�ۊtb�,��a����i�Is5(ԇ�iF�5�}��	��, ��f�}�����'���a;������9��g�:�N�Klg�}�1��V��qj��ٹ�b�6f�j�O����[� O;j�P/�w��?�w�x�L�Ԛ���{XG�8�j�+�OM3��Mco�xk�U���Z��=��y��ZBZV�=��x��-��������]��k{̝+f������OA��������V6�bG�������`�4[Wp�w�SӬ���É�g�7���'^+���3}�-|������]:�4X�WgF��Nqr�Z����7�]IM55�T��;��i�M����4�tA95͹#5�GA5�A��EJO:��^k�ۿ.go�X��
.��ZM�
����p���&~�aeˬo�����P��>��G�:��O���d�d0��1�*$���чv����W��OF)�~�?�t:
{R�5vv��n�lk�
��{��{l ��<jv�>qj�qDǟ2��¼j�����?N��#I%a�#'+��{߇٨K�h�S������颟���.�8��R���c���Lw!�?�L5�f	{"�|�/�����<�Y"^46�_�Qů+�#dE��`����,L���
S(UX���%
C�%ʡ.b��x��x��
�g�	�i�}��ى��� `u���m+��|׵7G�O���|�8a�i3��F�_������@6���`g�p�"m�v��ۖ�v-��2�ű��ޢ��3�f� �s���6�˛紒�Yݤ57���BCU$Ry�����wUP۫9��T�SӼ��6����V���ɮ����,��fI�D�9G����?���<$r������a�!񚥑>H|6� c׬\
Vf�ض���2YU����*|j)sO/{�gQ���4��<aZ$T����#q��Z�h��D��4#"�$)��)V�@c=љ��hRh�߻M�����	Ñ\���~R��(�slZR%�t��Oqy�")F.�s�;����L0����F4C�� U�t{�y,��=�ac
�;b����A�]�
Q`�1H[�A��TĿ���Hp₃fN��~���j���Q<���_\e9�ؒ^`(s���E��SW�|��D�n��@�(���q�<��x����/��w���P����<�4�#�����
�����(��<�,0j}�,�`�E�(b#TH�1�(HZo��9XT"��3	I�ͻ#�i���#B&�:IxaZ���!��E�p����ޟ��Y~�!T�ND�A�&��xD�"�zOi�DG��|���l\(��`)F���/��K�t��m��F;����p���6���%�L�MR����~�j�� m�^�����"�V!��ܬ����o��	��:��7J�jЛ��V��;����<#1)�M�Ķ�ri2�o�+kkF�[��U �-�yW_�����Z�i  [m�"8�T)��������8xԦ�nC�?�>�<J#���Tt��kU�G������$��3������i����?���*�(�/�` EB jg�=0dR�q���/�^�����|�Ro�u�:�g�� ����A{V�I����E��&��R�ZVn�,��Ej�=3\<�m|�=��-_���y�ymc�#�t�N��:�p�e��TSPy��v;���o�_�S�|�����rA��zݧ�~�]pdn�Ex�3Q��Q��ɭn����o߻���T.G�s�?��I��nSp���	���{�xϢ<�z]��>y��0(��s��e�{�!�^w�@�zV/_���|P�C�p�%6y�&9���8� �[��������e���/�wS�n�}� �m)p�7]����>��(��R�ml)�����4V*D�0�d��K�|Lo�ؒ��.��-����l�{���V;���?��.��eㄼgz&12����O(��n��\��iI��u��_���L;���������^���}=�{�滗��Z��1�E�w�	��_�9���@��?���z�ݰ�j�0�����8ܫ-$Z8Ƣ����
����{��e�o���#�|O������ͷ��Ӓ:]�=Y&p���}����0C�$׷_���j/�{ׯ���>�k򿖸�����V�q(��%�=����o������s��_}����?��<�{>����3���pzg�����I&���D�(x$��ޝ�p�~�G������#���K�4�A± 洠$��ȴ� ���mxU֍���!M�}��� �F/�ki|����˫��r�ה+��A�sp9� A��!�8�5�Ty+��X�}2$F
�y���8������E�J�>�O�֪
����f.�J^m����r�E�vy�XVmW�F����1����P�v4
��Sրc���z7��]�>�ӆ���/r����w�U��u�R_5�o5^ƫ}M	�����Kk�luؾ���Ţ%u.L?����W���\�"��)�-�
Ē�ԑp�%�2��ȅ�B
��c���j��fI|��|�&A!����k~�XXm˃<��d.���d2�S�'��E''�I	7]e��t��7ݟr&��^�l�A,���k \��-Զ�8��s���v��	y�ö��[t�zȗ�	��"�[}�w__�ɾD^>��4�wLԻ�ݓo�"��~��[�e�����~}����
<�ϑ��Jv�&��b��%s]V���d4�o��5�TS ����B� ��x�s�'�Nk�O�V��x���.����oX%��I��\+b���"Ý��|�e����d'��sh���nX�����~�߻�+�*GJXP��@���+ǍI�ƦGĈ�
p�/֒�,�H�sZd���&H�2�l���뻼�_�M�/��J]>�66tJ-��>�������,�m�\����V��Q�.͹������� w�c�VZPb0�=��/��d��n��x�j7����Ԧf�VS�Z:���a��Z�2������Cx` �-�v��8g$#""�$)d8�G1�v��r��2�$I�i�s��Ů�tG�d	/b�Jx�b�L�-voh�Ty�H�:@���煯��W�~ݤ?����	 qv�X�OU������~����D.3��:q<�$���)�u�e��,;�AojN�'�j�tBdb��3�Ϝv2�h+P(��G�%�b:e�_p|X^1. ����(8 �<�C����F�`|>?{nMe&t�����zg|to��
��!1������4�7ռ�����rd7#���˝BS���M��pkp�]fj���沎C��/���v�h/C��8G�6e� a2�TVA���=7e'�x�ZŇN���Z�mMS���_�v��j��1�,JJ��|�|�?u8w�{'�60mq4W���(S
��09�'�!������ͤ�(6���`��2"SC�V�x-f�b8� ٦x���}FRoE�i��=-�\�!5�qb�s��?T>������L�NSʦ���F��@	��#X���yb]r��(���T��}~'��>P9�L�Ƅ�-�0y;�,�����{10N��Ly��CbL�OE/VЂ�c�磡�
�� m�Nҳ/Q��Ǐ�<j�ύ��05.�]��%:C��*(�/�` u5 ZJG��J:@dhq4������X����A׍��\�d��v#2j$?���*X�E�N��������w�2� � � #�b���*}|��ԉ�UG\}<Uš�:��+�;;S$wir��O��uP29g��+��H0�Q���`��o�~)S5-��䗖������|�(4i�EP.�'�ӈ���Of7:S$uA-���k����G}�AlUu��>R�zk����U4���AiiEX'^P��� ���H������S5E��.��Ηz}q�?�G��k���s����_�czT�B�
����M����T�'1JFv��V�1s�6E��b���V�"�n�v��S���	`�����s\�k�v@s�H��"��C�:�T�9@7�����5�e��f��Ȫ~��5��S��S��߳-u۷���3E�g����[�9J@5E�½��?f�f>R8��BrL��i�f\>R��/���(�f���3����fP�
�T��
}�Ul\���|�S�K��y�9{e]E�<"�[k׽>�~��3������Q^v�%���cro]��i�BhK
�]��'��<�������f��=�v �J���G��e�)��)�v����c�ă��e������:�Qd�u�両(U4";������������5�����ޅ~+��s���{�`�s����c�m�d�e?r�ي;���c��N����Mq� X��H�lW�3G������2Y�Q���0Sx��|�;�Kf��^�����4mRA��bT{P���, @kb<oP
L��պo@kc�˧$���)�8�n`���B*گ�����cѮddu�X'rS�k�ة�9�w�zV:�;�e��>�ׇ�_�$��\���c@De��C�PA�ӏ��;l�!Hv3��׃�
62���f��b�H��e��j;�%�C�(����U�m������$��*��c�O�qjx��V����i�7^@ө������x�R��9M9,d�c��I����5c�H��J�1E)u��0	4"�$�t2�?j��m]<��u�j�ʟdؼV��@�)�������%�g,X�����W��;��_��-���fG,��`nU�BC��"�a�����b8��}ؼf�pg0��4a�ł}l��4I,����Zj��}����H�D��K�h�|�~x�8�B8���cQ櫂�=�"���B~�2\��̅��O(����'(�K@[��W��u߶��律�xjH��Ol~����w�$Q_4r�~��G�\4�zE�2j!A�琰(���:|2"�W�^[T��9Q�!X]S%�L������KL��-�P�1"g�a�*��w�Ԇ�~i�ϚΑ�<����P�_-�}u
����a�\�ƁXpL��2���#���k�Rv�=̳Md�P�c./���D�}�9�b$2�W��+z'��~3
!��q(V�O
[�~bunǢב����6�L}p�GpN| Q��rr�Ү�Af�v�̕y�5��Z��K���2nL�7�Zr���@�W��"w�4.�Ɋ��!x��K��Np`�]�7?��%y���~�\o]����㵍}�U�$�\���>	'&J~�-���єd���B�����%
���K�$�3����H-%n�Hf�7��4�����ɄX:�
Ν-\�Co�؈1U(�/�` < �b|<PlM�����NM!is����H�*& �)�_�q.?#g��ۄGO�Т���2�FIK{[�>p�_����P�KWN[*[n̦ml�/��$Z+ś��(�7&�0n���.OV��Y��j�~z���q�� m�Z#�����:��}.�Z2�4n ��^Ъ�q�8��٧�����1�׸��h�ڰ[uٴN`�ڌ��M�=m-��o=���o0�NU�y�qB��ŵ���DA���pqt�Z_��l���ފ�<��A\���|��E�P{��_<u/9\&���v	�\W�^ ˹�_�ǿ��2�0�^� 	d4��]Q�*f�wW��Rr��M� d41�Uw�E���>��Y�݃��@f6����D`@,�y�V�T&������ʳR<����ZQUj�����^���H��z�����?h�82��ٰn�v�B�@}�p}(q��#G]���ɐ����I�
R
^_�'�z��N��?�{ ���"�V��V���3�z��mz�.�T�ڳU=�j3��Y��B4��nEU]Պ�U5u+�8�u7����˪�e?��ZWx'h8{�(��%񩽃3n�!�LnDA�i�_3�6���&�t2�v�M;��f�&�M8aͬ>�M/H{�M���:w@��YY��d�Cv���Y�O�wQ��W4�V֛��_Q�)<����#49��/f�tݭ:�����%�f�	�S��T'^Q�VT흞�cw MFA��9��3M�e���=Į���a��]]% �J',W4���WT���W�{v�C���SG)v�����Gk�� ^}�h�8���Ed�uB��U-K� �U�T�,����9���W:�L��c�Χ�F^N��Nfq� _�"F��_O_��	՞Ϳ,#�s/g\�2���'�l�!4CW��r�s�A���Ď���O!-�������
b�����[	��컙��>3�wUMS�/��?��v���M��C<A�yLc��5c��Ƅ��~�y��Kњh�!�����8�!��
�906x��]�����ʍs��-�B��.��;"=��X��`f�)i�\4�)D�k܍���<O�2�Ԧf����\t`E� �ȸ�ZK���i�rq��Ln\O-����W䊪dY
OoP�+��_/��&la�$*�6b��ԝ��� ��S+fZl�0~N��ʹWhy�w��k�?~Y^�L�7�d׸o��f�W,��{SS�$hރ�������y>a��ք�sZm����u״�xiK\�w�����i~H�8}�4��~���G����=�N>��Fx�A�$�^����]�ca9vz��a�Q���{��W4ڟ>�_�.n,�1�.��<��4#�$I�)UW<`�i���
HF
�(ԏa�[#q�D9v��]���ȄG�84^m�O����T[��7���暏�'�w5o2�<'t�����q���S�-�&m��rx�B4�xj�l6���0ȪB�`)=�}?6�Q��-�a�٬<F��Lg�:���d���_~�W��v��A�5A�+E}lPBʹj�7���Et��R��=��%ɻ��'�`�R�}���XGU`�v�5�c�l�AM��$1�DZ�5Tt|���hu��Xei�J�	�GC��g�a�̹�D��m����������)p�ܭvky�26��%�K�*�0��.��Bkn�>�|%���݆��_R��'���>�,���Vd���e�����z:X���U|���V3����<HRa�Ά��1r(D�@����X�_��<�\ .7[�6�T��v����C�;M�������ް�F�oɎ���P��B�ʜV);1������R��������s��	3<HNo���[(�/�` �E �v�DP�QcR� �Rb��Ä	���.�?m��������R �,#�&ť��A
b�A��f�Ϗ�do��L���-�G%������+ҷ�3�z�F�Q�?��%9�.���B�C#ޢT84��=�y'�`�����D�I�v9��-�EM�sl
%R�8��ɰX�������x�R!�[ �]���-�ţ�U�S�s��Ȃ�:���U<1����8F�@�I��otޢ��F=�X�[E��ͭ@����h�*f���o�<��`W�'�UF�6�-j�C��oE2��>[�2xR�=v2_ɅF�L ~�e��]Ȇ�W2/�K.u��e'P|��[���~���wXGy���,������;)��H4oϵf����aFO|'�玆�Cw��Xo�'�'Fq$x��J�9�.�g�B9/�`o�<j�����hDS �S�ôh����
�/|U&j(DOe&�3���S,c#���)���Ti��g�.�:
���O���Ro}���i����	0�9t)9��R�9t{S��D�����z�������dg7'I@���8���hҊ���C#�9t�ߜ6M�Ej�w��]�5�i	����~'�(��DC��)����8�-�G���9b�lB�i\��&��g����2�]�GY�D�����A��f'/�d��+�,������+
���?��8ξ�{}r{j���r�����=�ܞI������:Y.�{v���-偝ܞ�:E�v;���-�ھI���v��4�2��(�E�tq����W�z{6*S��H}�L���h�"���,�%��ͽ�FuP�6��	��	���󣳨���%e���0��K(�zŞ�8^_#/A`BM�yn�8�+4��!OP�ᨿm����嶶U�o�m�=Z6�J'���]�'Q� ї�ؾ��X�}����/��
@[�S� ň#T0p�[��i�լEW C��Qۀ\Y}�d�<;pzu;	���f4�����Kσ�J
�:=�M��ԁUDt�G#�Q�.=�����uLA��9tXGA��g�/}���*';m8����d�隲����MW�;�SM��`S>8�)������u�mUC}[>c�������XGA����*J�C7u3|�NwP���k.)�/�+R��{��Ď'(a�&T�DYqA�J�����ꔝ��L�igag��g�� ��j��HUe%5%6U�m�)(�I�RSVTMV���*���T��F��-p�u*s;����F]9�է~|q��Ѿc�O����g�=���x�w���/�\~�}���u�ŗ}�^g�|�������?�x�Ξ����ʿ8��K��(E��
�2��4�L�Ǌ.\�p�,6&���2`�gecl\l��*�ȵ6�\�%��2��K�2I�~�kch�%��L��[V,�xY�1�$rL�d��%u��j�X�b�^��2	�"�ޮ����_Ed�M�\&��������ּ�d���Z`�G��<3CS�`{%(AA���Mh���t_F�N�%o��$����U�f�S�<t�D.z����D:?}� ���q��xﾷ�'";{����N8�U�u�Ӫ�����ke���-�.{�����Ďc���4�}�B^��K#�o�_��8��E#"#)HR1� TV�@Dr(S6"II�B��C���R�C��9)Ď�\4�S���Y}(J��+�m�%kh�`rp�Æ�:\��o�\���Xgv�� ��#�*@N�lDU���1Q��Z�Sqm�d���3��%)^�:����\pD�	��/dW6g���֠��&�jD�R��7�3pfQ�$0���p�9�D�sgvpGby����Aּ����Ō�ߖ�*[�(y��$���o��i���[��L�,:�WI���G�C��(w�.�"��>F�	��`�@�²�O ����}�^4���d�����T7�|e�vT'��%��X����-�=ڤ\S�R�N`��Cʳ.��2���O+u���Y��7��o!�e���s�V����ʍLC۱��5�t��5��9�0��"�op|t$Y����p�u�;-�{^���5ǰ���&v�)�j;ҵ:���+�v�x ���s�iF���o�]Q��o�����|�n�v��/u監=�;�s[#f�W8��Ff�Q�5�͛�u�]�;�܃���-�m�F5(�/�` Z ��$)H �2Ipm����nF��OJ��(E��I?V:_۫DK�!J�F�����;�o.���Z�rXt��0G�Y  {��R�'��cS�<�kK��[v�/l���������m�T�z�� ����������J�u؎a[}�2Z�hqG����HR!�E�M�z$��"[����"�,���H+�NAV�7���{�C{�@{w�wp����j�^��6�/��e	��T�^�H��Vz��z��z��z?��N��{ @o��.ԅޫ���z���Fo���S�{�s���j:������-v��`��N~39��^����J~�p~y����o^�o"�[����{�~�<~�8_O��o�G��q������~���?}Gr$�Yx�}Ȇ|2!߂,���A�{�Ƿ��	3������;����阎o6����7��8��g�o36�;�h�ø�o.����f��8��+��{����Z�{�rV�P%<�:����N���wX��k9�'���L��f^��U�a1���Lle�pTG1�(�X�$3�Q�2�9�c`6�Q���_^�&�2���d�8�Ee0'q�9��x�L�%8�K����PL���!��s��x�I\����$3���|E���E�^�"�-���\��	�Ib9�eL�3�J$:e���`	s~q=��VV�ܕ��6�V*���h�q@h�fu&
��Ty�'�CM�X�k���@��(��TVSe��bHE��ush����6OkOhOTh� 4_�&�G3�f옜���\=��0K<`��kI�;{,	z��|q=4��	%7%/2�b�o�GDF0�e%:���!�Ő1��x@|L�2_�o�$�%&��z"$չp�D=.ݖ�|a�����f��"gH҅d�S,���>�g�l���m˶sV��Y8�f�l�-b��U�D�ڦY4;�
�g6moX���h+f�,fgX6���0��ua���r���5��cq����+�Q�4�i�v�M˴K��1��&- +W�[����^���
]��4��zH)!�B�4�U�A��O(���mB�P%	��nZG�t���7�F��ES1FiP0:�ʠ1��A���v�3�-(j�[T�fQ,zEWP+ZEQP*���<�b���|�|�k=ȁr��8������	y��p�9���Ѐ,4������0�y����n��E���X����x�`삵8�����,����}��!��a܀�\e�wX�s����0����i� ?� ;� �L����I~䛈k��_�N��&��}=Q�X�%��)�d0�$P���k��'C	v��ݖm�.g�l�n���f���g�j��W�a{X7�f���,��z�z٨wY�M�'�	K�a[��&���wm��8k�*}�Y����=�űzkc�<�R�Q��̴L���viYi���^���
O�:�H�HY�*R9'�Djȣ�Zȇ���!5���q*�i ��P�*�B��A��pΣvt���M�\G�n�6��9:G�8��Q:B�T�y�2��dt��`0jEqp��7��5���1�R-E3�bl�V
�K��3x~��}�z��`@�.��������s9��-�r,������W���w��U,��<9��`�c��}�ǥ��V�=��.u1?��a�q�������:�`H��K|�Y�y��X�y�������=7�;��>���q��,�r|e8�c��E��k��UNs�y�0��3�Y���o{`>�#�������0��Q��L�'0��w���	�,�=\e-̀�,=�3��a�0 ���j'Nx�&����͗���YL>�,:͇�����g����DG?�o��D�/(���DD>(���)��׋�	Ye>+1�������%���zN��-�W�"@'@/����r�C���x@44_�/(B�k=���'�ŵ^0���A�\��ܣ�tBǙG�Ʉ���3	��:N#t�tt�l:N9:�p�7��p���l��Y��&��kTn�ѹI���5��itn��q��B�yF���':N3:�t�et�:�p����A��4�t8m��As�����,��X�7��o���iE�&m���6����p�:/��;;]������L�q��&k}���X���	u���q:�7e|��qZ�&?�&�yn��8��8��ܔ�q��o��o�yn��q��8�Xn�`���f.4�x�x�x�x�x�D<�!N-7��V��ߜ2]���l�Is�o*ۑMv�M�#w6�;�ɝ���brgF�����R��R��Ry�;װ;wٝk��RK��y�6ـ�e*q���n�M�M)�m�Y�ɴnsiݦҺM��M���'�6��6�Ë�H6�S|�\$}N�I��I9��$ ��~�9�M�ɹ�y���H%��#!��q�#�HAg�l2���8���H5�����s4���2��jRM����ed�����O�i��m�b���I3yĵH-҈c�Wd�[�Vd�S�(H�K�R��� �d�#�H��9��ND�+\���S�$��	_�K��1$9v)/�>�nGx�h�>�N�K>��*y�-�|�F�G.�?���l�5r>�g��gߖ�Kl{��lo���CjfDDJ

R�b5`33DV��M���Դ�ے��#�����s6X��5U�Vw�͋­^��oEh���r��S)Μ������a5K�׫��5�Er�O�y�J�✾n��+��rX4����=?�Y)�g��I��G�4��KNt˫%~dU�/���.�H��m��щ�D8z��q����i��L�L� ]W��(����:�O!j�<_�]����+�����;�˕Ƅ�@�߉��P*(�/�` �[ 
 �-E@"R:��hmk���`���/�m�lF�F���{W���8�r �g�-�X�����B�C�+��a��6�1EJR�����c��]�n���m��}r�(������&���9&���6��ޒ�Zr;K�*�E(	H� �d��F��Fm�FG�^�Q3�Q+�Q#Ѩ�h�A�1j51j,b�WĨ��QGɨ3Hr�D��9{��E��]�"=�"�"��"=�{�R��У1E�E:E
Eډ"�D�6�G��*EzM<�
<:
�sx4+�NJ���EȣCH%�J�UeҪ�h���k�}=g�����l�El�!�u���m=�����ڭG��h��6�ik.�u�
Ue
�JT�]T�!�*��*APU~���@U�DUف�v���hwڴmH�Vi�5Q�O�*�@Ur��+��(�u�4+�N��S�[J�!�!���P;t�m��uv�����~��n�6���ro�Lg�B�٠,b���m!v��ڇ������B��B��B��B}�r�Y��;�r˰�`�������^�{��Na��,7�徲�V���rSY�)�-e��,7�e��ڃe��
��2��
��2��
��2��
}�2m�
]�2M�
=�2-�
�2�
�d�~`�n�L;�B7�L3Y��,���F��Gv;h���[��D�;.7\�iBT�?�� *������rw��)��L��B�t{I����H����r�Qn"e��%�B��G�~��d(�nt{�n�P�Q�.Th4*�:���E�A��@��@�~�Cw��(�Lj%
�
u�:�J#�@�*�6$r���G�����(��	�m�~��E������{�~�w��B���o�����'~��߬��G�N��H�{N���u�o:�w��]E��"~O����g�����%~c��W�7�
�v ~3��J���;�- �V�"I��k䷚��"������I~[��$�����t����b���o$�}d�����oN�nҩ3���^��$�.��1���n#~��vN���	8�8u�� dA�;N~���rjr� ���ƶ���a��h��f@��n$�}D���ۏح&vc����V��(ٝA�e��,���g`��d��2�t�ź�a]�����k/�z�u�º��k�uMd]�Q�d��6�ڐ蚐�z�������ڌ躌��MD�f�k$е�L��o���vo��c�;�v˰�`���v[��*�Me��l��펲�P�[�v��;n7��vwڭi��v��n"��B����<�[)v���ݫ�m��b���]'vӉ�X����n1bw��F�f����d`��-v� ����%�[aw��.�n<�=Gv���4��%��d���֒�YR(�l�$cn��m7���n���0�-�n���+�me���6�ݞ��Rv;�nC�m%������p��m>��鶦@٤@�)P��F��G��t������m���G��#n��Q�.��w�v��M'ncq[N܎�ň�m�vq�M�#�(��@�J3(��m20�tb6����8��6��l��k��pbk5b�4"k4"�3"k3"�2"�7���-F�n�È�lb61����@� �����K��$@� 6���f/�N+ Y#�� �l��	�IlB�Ob���>�Hb��_b�Il/������U}G�6�>�#��2O>m'����I�9�����t:Nfϑ����5��&��Nǐ��d���n!Y{Il{����[2[Kfg�8R�D	s��]����`Wo��3����
v��:�]�dW7����%�������]��]�FW���r��p��n��f��2q�q�quq5q��Q@,��X~b�\]N}'W�����j�F�@9A�^�J�Y��X��X��������:�}}���`_O��#��N�u�}���^�I�����hҁ��S�ڥJ�I���n��\h�Z��Y�k4�4���*�D�n��刯ሯ݈J������e��%�k%��$�k$��#b�a`�V`�O��"0�tM�����pR�)����!��Xm/V[�jӰ�3�v��j���-�6���j���'��	�]�jYmV�S�=�=��qT�~B�1P�B�����'j���Q;)j#E�9Q{(j����i�vQ���=EԖ"j���[�����%j_��<@�*P���j+��@��� P[)��(�Gj���jR���^"�?H�'�mAjK�B��~{��b�����a�c�o�ۅ�na�Y�o�;O��O��d�H��D�	H$������������K�O7�O/�O+|�O>]�O���(��#�^�O�ɧ���\��-���|:KI#I$�2Kf��l:��f�ݬ�m�{��&b���l VjV�Vj2+�+�+u+��=f�ì��f���������T�{�zKY�(�e��l6��>��A�Z��p���O���w�ٜzk�t�.���|h��f'���f�7�&R�ߨ�n4{���zw����LTj%*�*u�:�����Do��G��#z���Q�.��w�w��M'zc�[N��ۈ�lD�׈RÉR��N#z���D�0�7��F\�	�tpi&��f��e�7�=z���%@�&�{	�V z+��OߑR��v�wQz�I��dI��s2;NzϑRk��k�;Mf���Rj0��%������֒�Yrir� ҈t��:Mg��X�66��f���m�����b�Yl#�i"�i!�i ��ۺ�mMf[ﰭu��9l�6{̲�a��l��fY����,k/�z�e�²�l��Ͷ��U6��fO�l)�e��l���f`�F�NY���5�f��5��`����p�W�?��ٝ:�)��fk���N/��I���bߡ�F�t�f�Q�;�ڎb��l"m�FY���ݨ�c(�6ښ�b��]��hk&�Z��^@['��	hk��!�5!�� �O�$b��b����'f+��<b61{��bvQ̾��� (�/�` �Z 
��*E@�Q:��f��&c�"G�w��Us7���UF �KlU2P���\K���n�ũzT	�JJ��\km)��$e
���>ɭO�Fk�|����Ǫ2iU�f�C?c[��q/V�dV�E�*��8�Z��s�x�a[۰��lk,��ʶ�a[ð�]�x��Sٸ	/a�S6>�ơl\��7��T`U���2ɶ�6���{67�6��2J�PwRU�q��$��d ړ��*�*5�㡪���;�����PU�����x����M�O�R�R�Q�Ǩ�E��!Ե���梮���Եu�E]_Q�V��j�jtj4�/�k�u
꺊�FA]SQ�P��'j�jtj4j�j�5�U�ښ�Z�:�����%��+����80Ɠ`��#������$��|�f�^�V�N���2`��ŀ�0��N��;�����L}�tm ���$��Z��d��z���ч<��<ׂ<�yR�y?���������I*^ON�zR�דQ����Łxq^|�?�ř��O�K^k^\_��I������J;�ߤ*�d�������J.�J-ϒ��d܅��2�B�Wȸ
ٓ��� �(!H�|y�T�t�s:�s�H��T�ٕ��2����3�ۋ��a��lwۍ�vW�n*�m�v���S�{�톲�"lw����p��v��P����,��C����7���~��>`���W�[؍�����$��v#�n#��v��ɀ�c���TH��B�V�C�ѡ���L�#
t�@��6"P{
jǠ6j��N���=�;Z�wt�h(��C�=��I��k������4����i��<m,O��/<;������{���&�iKyy��i��v�1xpV�x���ImER;Oj�I=�Jm�Ԏ�vTjC��Sj;%Ҭ�3��I�ɧ�$�[J='��R)�iH�+�m%���OKI8GI���Ѫ<:����v�o����s��6ڥ�,7�]fY�٥�,�"vi1˚�]:�r+Y�
���5���e�d]#�׻�u_R�:J��)�Ct�-U�I�D�DY�ѥ�(kM_+)��j#�k"em�.���Х���gt�&�Z]��jQ�L��5d�\:T����Oi)��Q<��xq����������{�����Yx�*<�*�5
/6���(O�{9y��c���Yɳ� O΍d������3+��t=HƮ��[jkɚM�撯�$k-����-%�%���ҪT:���Q���I���&�����Dll66;I�(�}�Ʈ��5�����hl34�4j4j
4���~�^�`���l2�.�K�ޒ��$��ga�R�J
��m�¦@awy�Qx�?x��$�.	{K���8�z����VR��k�5��s��s��;z*]�I�]����IB�ʗ>�g]'�?)��c�j�nm���mEr;On�I>��m�܎�vTnC��SB}'���5+�\�a�%k-���-�MCn_�m+�uGI�O�|����l�F��r-7��Vb�.�����"�5����V`_#���,7�-����ׇ(w�ܜ����5喣\冣�IZ4��6C����h�G��L��QnD ��An|M_��рM����mx�Y7�g�/���<n���t�W4������2����z�������Hr+��y�O2=��R�K��J��v�8���-�֒c�/-�MCr_In+Y��ĒI�٤�l�F�:�]M��Ѭ�fv�A�Y�Ǭ�bV�0���X�X���jv� 0�R*4L�n��NWs�f&]s �f@Th:�Z���c5]����h�H�4��C�R�]��jT�3*t��}D��4�]�\=W��j\�:\3o�S�5K���[3ώ��/�ſ<=`sy����6��Y�j,AWy/*o5	o��wt�4��:��r�Vc�V�V�V�[�H�V$W���xҎ�r�T����\���V;e�I�u2�-��r5�jr��\m%�����d�Q2�'�fU�9�$�p~�pn�@�v�M��hvh3�������=f��C�Ym��J�u���m�d�	Xm�iݧ�th�¹�ڝjsz4���MG��v�G����6
4�H6���0��ҧ�@��Q���j��3�t}��B}D���}:�z�������bs��
�Pb+yP�2

j-�bGI��$��l��6�f�6ڸ�b�L�L�٦�h��2=f��L�����-ײ�6^��i����ϰ�6���[�,?�,=�,9�,7�,3�,/�,-�,)�,�l�L6K6K��%�6�q�f�G�ģL�4��q�6��,	Q��h�H?�8�eH�V�q.4K+��3�B�4�q��&�4m��6�i�?_���8�`|�k0�����#/��:`�s�,�Y��N�[��0��c�W���e0K(`�O�,��Y6�df��� �+�x
0^f�e9ă-�c��e���/�i/ϐoxYZyY��axM���
MWyq^�P^<���x�^�J^<���ϋ���t"�%,��+��$�$�lz�,�d|)��2�72�Ff�F��d\��?�LOɦ�d�O2BƝd��W�YN�h���v�Y�F��n�6��6��Jl�e]f��l�����l\��9���{g$�M�n�PP�0�n�v�ۜv��m9���B���ptc��w&�m0��V��g���v3Q�G�u��t�=�cp�р�i �y��x���n/j{�۶�mgy�X^��Wᱮ�Ix�R�Gy�����6�[���m0 `�Dh�"����+2�@<}$h�J����5p��M�YwP�2׃��Hdz�^�F�G��̺o���8X>m\��7y�;~�4E]-��BNs�&�ھ�أ}�M�+��D�y�X����k9��&��d���[z�E?z�AT5D��v2nR(�/�` %[ Z�$,HPn:7��Ʋ$!���̫~ӏ�ن6�q�`�!��
� �@�=˝�XB"�fUA�N�D8'�T<�;R�2�����ܶ�k-�c�ĵ^�X'q����u�L���w�#[瑭�d��$�lmG�6��&$k$i$�Vm�.�t�m�e[�����;'�wF`��Uz�����U��&mF�LF[g�J_���h�)��mMD��I�h�(m����S��z�4N�!�g!��.i&N�%.�$N�#���̔w�#��#�����d�G����Q�V�J��I#���4[���j���1gY��,�G,�W�5���t�4K4��GU�Q�rTu%���ٌ.MF��B��DO�DQ��蘃�t�(%:�SƩ��T{q��8�[\��8.�-�s3n�.8�O��&n�L��1'qE3��xO�qS�ٕ����z䘏r�FI��,:(ǌ$U�Ru ��Ӭ�3�Z������kY��X�Y�5�u}ĺ���aS	¦҃M%�J6�l*-�TR��4��$���`S���1�*���r�=e{J����CSه�r����5M%K]�QT�Q�f4�j�)ɨ�,�W�k1�J*����.�ڈ�&�����u��T��R��K��u��J./�[^*�x������'^*�x���PY����z�J �k�k*�\*�*ep�]p{�)�����t皉C�g� �:�C���J��uvޓ{�'�ܔ�d� �J�vҵ+�����#Q�G�N"�o��Q�Ҏtm��L#S�F�V��4!]�k$��	R���fe��<�6�e�e�X6~�Ưl�6v;H/~ǋ���n^�͋���l^���W/���Ѽ��W�x�����ڌ���.�&���x�/^܋��Źx��m��}�۞��%wg%���ێ��B�x���Upq".���n������|d�(�k2�F��d���K��Q2�BƟd�Iƛ�9{�Ζ�30n�7ۋ����N9;�, �k,��­Xx�Z����@/`�,܎��(܍��P�J�j����x��=8Ӄ��^[qp*n��Kq�(�5�ډ����&��A>��g�� 8x:���c@�G����z�G�nJ�,ᲄ��'�1��+�K	7�p>CR���fg���I�l$v�;{��V`g��1��)�s�i9�t�Gg��"���.��ɼ�i<��8��8��8��8����V�� 7��&��ޓ��rv��=���$ӧd:�4���X�d�������.`a���x�¶���(l7
[�ǡ�W
[���Ba��`7=ز��������98�Tll)v_��>��6��r�Gp��\�#p�	p�p���ޓ��H�~$�>ޔ�g	[��c	;O�	%쥄m&�T6	{��-�Ir[����v���ec�1&��F��h�,4��=��6����v���m��󶙸�$n�(��2���F�C��jYgi��z���(k3zg2��
eDY�(k�n_q��p��pl<��_��
6>�Ƌl\��C���)��)�S
Y�?��Z���[m��k����S�T;�j/�)7�vi<I}r�����8zJ8zJ#�f��,R�5��N�q4�z=e����B}2
�I(�K�l%tv:��FB_�����V�������q��S�u}=����2��T5���I�u}͂�f��W��K�uU�DU���GP�"��T�U���������󴑞�O�����i�y�s<m6O��i�������i�yڪ�]���x�6^|�wJ2�i<�g<�f<�D�u�5O�������iw�x�-^|̋k��Y�8/~ŋ�y��<��5�C���A��**�p�g�2���^/9՛[Zɽ��-��~�P����#�u8��|��I/�'�8��␾ⴅp������]�i���r�*8m"΀��i?��n��ȱ�^��N��D�)���;�#��R{M��S�I�7R;LjW���SNIm)�:Jj��>	%������n�q&铧�� ���zv[��yv����ظ�z��c��*�Z��m��߰�m��Rvu�]-��c��/��6�d�K6���Qظ�����$'a��ꟍ�v�w_�y4��q���h|���C�it����k��E�6�mE��t��n��St;�nϠ�B�-�n7�mt��n���Kt;��������V�$��IZq��!���H�Q��(�`�_�^�\�[ҧD��=�MI@�e�Z���yO�'}�)}��Z��@K�]:7)��������{pt���N�Wp����s���:ޓg֓Jܔt�Ig*�@=G���G�ѣ���������������Oy$[��F���X�H�l#V������";��7�Ge�.R�a��"*�̓�Ƌ}%��l {c3�~��2){H��,��jV�µ�v���j�p����
���Վ����pT�H��P�"�M�i��؊��� {pp(��59���ř ��|��.��C�=%�$�����p,6�����oX8��/Yx
Ga�J^�,���;�I��������<
_R�K�l�F�i��������<x�����<xу�\̓�yp3�z�2ƃ��^<x��C��$��Wq�*�ܛ����8�
΍����?�P��.�=�ƀd�z�G&ݔ�d� �JxQ��$����Ix	����$�N�$cȸ���O^qq+�'�������:���:ҹ�����xS�$S
�W��'���z��}-��yV5���:�z�j��I:�u�U�fO�fO�f��Xm1��������)��S"��4b��,kV{h�qX����Zʲ�����u���e��j3Y�%���j���JV���N��$l\�����`� _#@TP�Df��i�B��x������x�� t�ABa����A��D�e���>�4�BR�9���.��(�
(�/�` �= �� Q`�ݤ����'�/���W8_|ߵ��;r,�j7�����
n�O������?��G0C4�I'8��K �2�![���_�메�X�zM��y��W������7��7�o�����W[ov�W[�Ɓ�m`�/�����%��e�,9�Ƨ�������Ň�ʇ����5O�� O�ču�@�_��/�{K接�Y7����V|q$_\�6����`���'|q�/^����l>� |�?�`}�;��|q���/~����S��'��|q>�6_��-����/��yq-/N�v���O^|��ɋ/y���`�Ņ�v��v�������,Ã=�-��k��,0�Ư�x���'��M0.ƣ�8W�q'�[	�����F�G��0^��C���d�����x
� �d�����q/�^4N��)�S�x��P%��$4>Ba��xO%�qȦ���Q}���:�M�2ScGi�+:�'eZ��������
e#E��Q����S�=�-�m���F�LS����5�Y�=���W��H�y��.G>y(s;��ࠔ(o�A��O�,AVpO
p�����ɛc�f��)L�3s�?ޕ�1�������g�ɶ�(�<�Uf��՚��c���T3u�QZ�Ra8�|CQ�H���e���Q���C�ў^�(�.J�{�w$�A�����'�x�*5ʴ�(n���O.�^��EI�
����BY(�� �� ��I.n ��ɪa�3�����ķV�U�ҪdYq��'��} ֳ�=���dl��i����z(�,����@����WkۊSYqKuvT��j�N��Ro_�,N� �-�[��m��L��A�|���ɣH-��*̓5�B�I
s�3�|�����(��J���Hg�j[kJ�e�T��!C��N���0Si8J��Ԥ�:�74�F��Gr�m�+Ui]�+�i��)Q�Pu
ԯZ���]c@��#C�V�em���j���C�鑋d�ꢴ�GvyG^�����)@o��Ю}`�Y�ʤc	5Qe��>��,��ʭ���F	����G^%�?9���<�䘬�k���e[�ةRN*���S�EI�7	��ERk���Gf���k$�1i�W��նSc�u,m7P��6ʮ}d�<2�Ov]#s�$׻r�� ��,��唍R������;R�Pr�P�pP(}|#��I+���W�LkNe�r�&��T�>�j�n=�%'НF����S]g���<{�������m.ku���GHف�,�U��\���`$.ڹ5�a����Wn{��`�5��og����f�6�-׮�mz{Ȼ��5}⥡x�6�i��&}d�{F⫑���m��\�3��j���ӛ"���Pfa�Jo��J��[�2ֳ[.��r	�t����N[��ַ�8	������8M/-�=r�[�,|䭥���/[9k�[#s��[۽�e$7��W���Ww�8U��Ihگ24`g�;�Y�>P�t,�f=�٪��jZ����R���]GQ��
��>0�Yj=�WG���&* 4�ѬqT�6Z3�[e�T�M�Q��� T��=K�S�S�Goj�:�)L���<�&:l�5-J^!��G�0�l�I{(�
����5�2"DA
J�����@�D
b4�3�(L E�Dڂ��%�b���2���ȖڹX��B�'�<��5�7����W�r��%1膆c4��esm��2�r �X�B%*
�΂k6�u���M*���DN��o��] �#���Ӌ�^d}�l������]�/�ހ�x��W�V���5�G�������=7�^ߒN>�c�]�.?���2K���=k�?tj���w�3ﰏ�⮵�*<��B�ǌ%��̄J� �L[�ֆ�+��p���h�'<�ٿ���c�桫�:����| 3ܨ�ه�F6�[,��:��"_դ�YF���W��T3�/�A�� ��͈R�6U(�/�` �N *�P$D0��J��i3HɱcyHd@	����9{F����Ε*γtn��u)�җ֞ˬ_�[�-!r�I<;e��%�Tr{�N"9�|"�ܜd�AnM�I�˱ri2Mv]YDrݙ<�VW&wH��!�2�d�|:��!�$^X���Af�JBI/f�G2��$WJ�G�H,�ʭ��ܑ��J�|tVf��o�l4Vb%���*]�U�h���Dgf^��%�7�P���K(�.��%��������[���,0�3���>�(n��pϋp�9&�;#BC�A��x�A33�c�e#�ry�]8�Y���+,��
�!��~�	W!��vۍ���t!��+:E�eCg�<�����\g9,��w�W��]9��.�(���\7�&W�%��$XɁ���c`��:*O��M�.ʳ�-���،�8��x�����ɕ���%��$/:�`#�H.t��&���}62��,�d�Md77�X��f09�X�Z�5��+_y밫�c��7p��R���L��� �D�:񪫾���i�3n�}���&@[��V[1��=ٶf�b#۞����f��u�MIm��i�~�f�@�&�����N?�k��6666�͂Ҧ,6?��;����i{a��6�m��l��ƴ�ʶ7[��l�8q9(i��8��A8X����	T����F �1H�>�cPj1(��A����� x��!~zA��+S[[4�t�n�JW�hL�(�֎����5���?s`.�9�c���p_�,����68���;��\���A��������:�%9���������9������uZ������:������oz�=���|,iI�8ґ�zы�����f7�N��x���u7�9U��,�����X��p:�s+[�Wp���c*S��)O����\�'?Y�>`�؀u�d'��&7�j&3��IN�6�Y�u�G>2�F6�l"����w� �^{��G���:Ǵi�px��TL�t�z��nR'��iQ-��UQ���+kYݠ�T?���O��N픊��:tt��M��ϱ)�Fqk�D��XǊ�h��94ES(�L͔�ʴL���8'V�¹/�R7gCk��^�����渔K�΅��$�~P$��v�#NK�T�]P�(E�t�"\V��U��[N�Q��ګ��rSZ9M�EV9J9))8I))�H�(�\�<�R�P�(G(	�WEyU��KU�wT��u�Z��>��>�喳7妤�)5%�)3%�2����H2k1R��Sb��`$)��E��R^ʫ�H/�6���<����iI))gG�HIRBJ�Q>��(e�%��q��"k#JD)��<�:.��RǄ�P긊�"k�eYj-(�Ӂ2Pb(e�?�'q�'���}�O�|�O>�'�$m=�'�Γy�j<�'���w��v�N�dI�����ZN����8��I8���|�Q�I'�6�&�^�kr��T��X�e�4�&�"���g�LJ]&ˤ�d�LJ=&�$�bRL�8L��{�"�"����>�����1�C�;�)��C�`L��!qH\,Ų�.�%�F!OH �� ��[rKN�aI�	2���JBI3I$�� 9@N��G��"Y$kL$�d�CrH�XH
ɪ�d���Wz��@H��ʮ��+�R�6�p��<o3��5�&�3a&���2�&��>��=��feeeEA�Cx���p�8>-J��� |:�ـ>���l?���}p6��܃8փz��<�q����w�������@(�dH�W��:H�	|q:Hi�	�?�k��k�~���y���R���<�:ꪻP�k=֘J��S1u�K�TO�n�E�h׊��[��Ҹ�e�zP�Ɓ�7�j���5�S?�1��i�(Ey��{Z[O���y��P�)�Rm�vj�:�S��No<�sz˩��8����o�u��i�lʦQ��v5U�{�c��(u����i��M�4?�3���Lg�)���1��TL{����bk�_��\�P��ZC��z��2T�rCc(�\ʥ�]�������,��J�BWhm�B�N�)��A��4�R-�/����JsjAﰆ5�R+�+hͫ�Jo
JA�	:Ao	*A�Ao
A��@o�@��R)��Q�4�B���@�V�
tvM�O#P:�I���z@gP���:��Z@�n�&�ͤL���.�lJ@i+���I����
VI��� ��W�J�H�7R#�-@(@(m 
@�"-R�DJ���)m!R<H���W��)���jWq�r����(�>J�G{��Vkg5�^�(�־���Fm�6V���U��U�e��d����I0)H�d8��!)�`a%	E�H�Q9�p����3�r$f�����*�͢	�}e�t21�Z�TO���xܯ�2�&�rJ�C  ���4�_B��bj3���qDjA�7`�X�| ��h[�X�����B��^� v�ÀB��D��o�ʭ�h��iS�0L�vz���؅��(�/�` �7 z`�60�M:��|]$й�χ�A�{�躮���Q����{�?�Mup�2��έmm�R�:1���{��r=�o�Q������Xs��ed���rg��\�^ŭ�_B��3Gĩ�;����*g�x+�w&�	0�|���w���gv��&<��=�`��וO���u㇬|�Zq:�O���Q'G�g�'�U�y�P��qlq����o�ь_�Ӷ�o���W��:�	�G���e<�]�j?�)�\�{�x��������-�/|����^�E�1��73[.�><�p����+����b�"#�׿��m��>� g>��x=�������L�Xr����[����A�{����:Cc�m�+4���:BC����[�5[7{���q���8�����8ɯ*����\L����D����r�ffZu�Lkg�����k_��m��vժ�T�jO���RKjG���c"\�C؎�8�Pj�Vo#����IKi+����|�i3��ݴ��o��o;��5�Mf�6v�C�h��]����:�Gi��|��y�9�&ʧ�K�&�#��l���<����C�@�!�HOGB�8�(G�c��!��Y$��..��z)ǂ�p�v��Nm!4��l4�t��i���45�[3M���L�/[3M�9��
���������ty>
�n�N链wI�t����\���x~�v^�t�^��Y�P��r����
��	����w�w{�����|�<�����	|���e'�ؗ��n�J6r�:����XaUW5��hEmUY�UUUMUQ�S�T��*�:����*�Zk?UO�S��~��r������b�|�R�T+UJuRݫ�j��W�*���:��*���*����QJ?i'ݤ���V�II�"m����f���:���AH��\?�G��ͣ�zG��]�:G�h]�i��1F�hݢY�V�):�Q�6�%�D����!Dhݡ9�z5���Z7;�,�G���
�)�IUR�*W�T}��ROjI�ׄzP�@������|zO��<��x�N��:M�紜��pZM�i4}��t�&�cZL�i0���t���[:Kc�+m��4���:A�=��:��}�fM���V6�����v�ks�i�,�W̊U1*6ťx��O܉���7q&�cKL��8��#nċ8bC\�	� �~��a<6�e��a1�����]�oa-������U�
Oa)���v�M�	+a$|��,�U�d�źX��!��nط���:X�]�P�O��N�����雮陎�|���U!����Bc��T���Q�&SfHdDD�� )��5���|�yޟ�.B#���YE�˕Vt�V���$�Y��+A;��Ʃ��R;.��JOa/�2�����>TRӓ�Y�(�C�F�[(���!�tV�>��Rq_[G_J���W�%x�M�y3"FZ���gZ���w��V5�.��e��1��dZ?��C�tY�0i4���܎+l���&��9�d�,f/tOO_��4�vD����w'l�p����ˁ+�����6(�P�;�4������~�8P��ӫn���k�5za��V}����$��^&Z.�Q�ߵ7�%���ZuƲeb����F�0��?�l϶�WoҩS�Xɓ!X�B�2s�mSH�5�D`��Q��I�M�:��� �q��lH&[+`c��O�[��m�$ځ�����L�5u�����V��E��W���\�x�� 
�*�8�A>��������e+�~���4>N�m�� xz5��@<(�/�`? }�Д��UU����8�:
k��\�kя��l��L�p�U�TE�S5�R%�Q�P�O��N�����©��)��i���
i��`�G{�GwTG��8z����_m��|�k����h��*+7X�u�6��;s�v�6��k�8��?*��&�yl��&�9lZ����)m>���)kƚ���l�����k暯���j��r��gn�d>�b�`��^��[��Z����ʭ�ʩ|�	/�Q�O��M��K>x%O�o�ȍ�ȉ|ȅ<ȁ\�?��=��;���q�q����en�}���k��g\�c�_��[��W\�S�O��K���>�"� ��Y��	��t>��6	x��,�(�Mb�פ5YMR�\4 ��D���mo��<��&�Y��d7�Mn��&��MN��R��5}�h2��5��gҙ�5��[�֬5��e22��vrNr�f�j��Q���Xua��_��0111���U�� 'ȶQ�u��],�^C���m����Ω��ʶo�V�`_4C�ؖ��7��f��f�͹7�vi��]��[��Y��X��Ww�Vg�UW�TG�S7�R'�Fgt�/��':�����z�z�7<�/��%���\����\���>����n��l�fj>t4?s3/s2s130�2/�2.�2-�2,�2+�2*�2)�2({2'k2&[r%S�$Kr$C�#;r#3��Y��ِ��Y���؏���������3d�B��'d	�'EHN�(������[��[�u[�5[��Z��Z�uZ+��
����ʬ����ڪ��*���S=�P8��eS6�k��)����n(��i�	RmP����uݫ��uEUt�(�׸�h���Pm1�Bԇ�<iB��&R�2���Cf�)Xd���&/Ә��(o�k��TU��]T*�Bu��)C�$I�|
0�$�m��~����D�В0J͖IJi:�~P� D��"F������>�&�_�U��)s����F������<�@�y*~~��4{o�k]	��YM��ؘs�7�xQ�f�z��%P��q�yi�4Oh���@�:V��>��2G��͸��.�pS�M�y�w���%��Q47I�pʕX���Y�Fu�Lúę�)Ǝ�6����V�ޕ�s%���Xk4ǌ<F㋱Ę7⍇3�<5g��dΘ)fq��W:��y�9�K<�~�`�d?n�?�p���&9G�	0r�pPlۀ�,j�H��Ř;S�V�\�Nq�@!|Ax��a��pc�_؅[����J�t�����	����v`S�D%�MQ�R�ˢ��d[(��ڵPN�2�Xy�J�� ��@���3^ۻ�N�+���]4A��Aיtf�4��d�ʠ
j��+�.�����q�C���k��Ā�l�vf�9h:sΔ3�L8s��\'��S<��z�-��u:�x���l�}�3��X��y��w؇�X�t�s���&��r}#�z�*W�(��'v�&f�%�s�0˰\ �C;8�n���v�j�j���K�i�P>��ZW���n�����_��~�s%��)}��ʜ����`��F ��+�����dlDDD$�� �0A�区 uCRS�e��F���p�9?�yNr�Ŋ>g���z���;x���K5U<~G�T�~��>����c|�]�c��LX͌Y3#�(ʛ����I�[��ϫDZ��U|@�9�9��zUi#����̠��i����B��fهRr-�63�4��w��5�-���g���ڜ}6�޹�ۼ�׿ע����CO�l¶6�Ȱ��^0=�͓O=[W��f�f#h�V _��Z��A��?�f��ްhMx:cy�Xg�(a8��f9��h6%t!��d�#�C�wmI��{?�m�f�b����e��胣w)Us�\nʙ>;�pG����.(�m2�xA���<�
q�^G�Я��K��n�_@.����A�D�.7��Q���L�9zl฽���/�R�߈r�ox�Oܭ�{׿�����*RSCC�Z�y[remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://erdgllynwqkw"
path="res://.godot/imported/Roboto-Bold.ttf-3674de3d9ad3ee757cd4b4a89f1e126d.fontdata"
 �Ħ�>=�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script %   res://Main/Scripts/CameraMovement.gd ��������   TileSet &   res://Main/Tilesets/Path_tileset.tres \�[   Script "   res://Main/Scripts/TileManager.gd ��������      local://PackedScene_r5ax3 �         PackedScene          	         names "      
   MainScene    Node2D 	   Camera2D    offset    script    TileMap 	   tile_set    format    	   variants       
     �D  �D                                        node_count             nodes        ��������       ����                      ����                                  ����                               conn_count              conns               node_paths              editable_instances              version             RSRCʣ����extends Camera2D

@export var tmap: TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var dragging := false
var mouse_start_pos := Vector2()
var self_start_pos := Vector2()

func _input(event : InputEvent):
	
	if event.is_action_pressed("move"):
		dragging = true
		mouse_start_pos = get_local_mouse_position()
		self_start_pos = self.position
		
	if event.is_action_released("move"):
		dragging = false

	# Camera Motion
	if event is InputEventMouseMotion and dragging:
		self.position = self_start_pos + (mouse_start_pos - get_local_mouse_position())

	# Camera Zoom
	if Input.is_action_just_released("zoom_in"):
		self.zoom *= Vector2(0.9,0.9)	
		self.zoom = self.zoom.clamp(Vector2(0.5,0.5),Vector2(5,5))
	if Input.is_action_just_released("zoom_out"):
		self.zoom *= Vector2(1.1,1.1)
		self.zoom = self.zoom.clamp(Vector2(0.5,0.5),Vector2(5,5))
�[)���rextends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta)
	pass
extends TileMap


const PATH_LAYER = 0

const direction_vectors = {
	0:Vector2i(0,-1),
	1:Vector2i(-1,0),
	2:Vector2i(0,1),
	3:Vector2i(1,0)
}

const direction_array = [
	Vector2i(0,-1),
	Vector2i(-1,0),
	Vector2i(0,1),
	Vector2i(1,0),
	Vector2i(0,0)
]

const transformations = {
	"forward": Transform2D(
		Vector2(1,0),
		Vector2(0,1),
		Vector2(0,0)),
	"right": Transform2D(
		Vector2(0,-1),
		Vector2(1,0),
		Vector2(0,0)),
	"left": Transform2D(
		Vector2(0,1),
		Vector2(-1,0),
		Vector2(0,0)),
	"backward": Transform2D(
		Vector2(-1,0),
		Vector2(0,-1),
		Vector2(0,0)),
}


func v2i_transform(v:Vector2i,m:Transform2D):
	return Vector2i(Vector2(v.x,v.y) * m)





###                             ###
### Tiletypes Class & Functions ###
###                             ###


# multitone class, should only be instanced one per type
class TileType:
	var tilemap_layer = 0
	var source_id = 0
	func _init(tilemap_layer:int,source_id:int):
		self.tilemap_layer = tilemap_layer
		self.source_id = source_id


var TileTypeDictionary = {
	"conveyor":TileType.new(0,0)
}

class TileSprite:
	var source_id:int
	var atlas_coords:Vector2i
	var alternative_tile:int
	func _init(source_id:int,atlas_coords:Vector2i,alternative_tile:int):
		self.source_id = source_id
		self.atlas_coords = atlas_coords
		self.alternative_tile = alternative_tile
		

func get_conveyor_sprite(tile:Tile) -> TileSprite:
	var atlas_coords:Vector2i = Vector2i(0,0)
	var connected_tiles = get_oriented_neighbors(tile)
	var dir_index = 0

	
	# if the tile has a direction or not
	if tile.dir != Vector2i(0,0):
		
		# number of connections
		var connections_count = 0;
		var connections_dict = get_connections_dict(tile)
		connections_dict.erase("front")
		if connections_dict.has("left") and connections_dict["left"]: connections_count += 1
		if connections_dict.has("back") and connections_dict["back"]: connections_count += 1
		if connections_dict.has("right") and connections_dict["right"]: connections_count += 1
		atlas_coords.y = connections_count
		
		#alternative tile based on the direction
		dir_index = direction_array.find(tile.dir)
		
		# coord x , orientation based
		if connections_count == 1:
			if connections_dict["left"]:
				atlas_coords.x = 0
			if connections_dict["back"]:
				atlas_coords.x = 1
			if connections_dict["right"]:
				atlas_coords.x = 2
		if connections_count == 2:
			if connections_dict["left"] and connections_dict["back"]:
				atlas_coords.x = 0
			if connections_dict["right"] and connections_dict["back"]:
				atlas_coords.x = 1
			if connections_dict["right"] and connections_dict["left"]:
				atlas_coords.x = 2
		
	else:
		var neighbors = get_oriented_neighbors(tile)
		var connections_count = len(neighbors)
		atlas_coords.y = connections_count
		atlas_coords.x = 3
		if(connections_count == 0): dir_index = 0
		if(connections_count == 1):
			if (tile.pos-neighbors[0].pos)==Vector2i(0,1):dir_index = 2 
			if (tile.pos-neighbors[0].pos)==Vector2i(0,-1):dir_index = 0 
			if (tile.pos-neighbors[0].pos)==Vector2i(1,0):dir_index = 3 
			if (tile.pos-neighbors[0].pos)==Vector2i(-1,0):dir_index = 1 
		if(connections_count == 2):
			if ((tile.pos-neighbors[0].pos)+(tile.pos-neighbors[1].pos)) == Vector2i(0,0) :
				atlas_coords.x = 4
				if (tile.pos-neighbors[0].pos) in [Vector2i(0,1),Vector2i(0,-1)]:dir_index = 1 
				if (tile.pos-neighbors[1].pos) in [Vector2i(1,0),Vector2i(-1,0)]:dir_index = 0 
			else:
				if( (tile.pos-neighbors[0].pos) in [Vector2i(0,1),Vector2i(1,0)] and
					(tile.pos-neighbors[1].pos) in [Vector2i(0,1),Vector2i(1,0)]):dir_index = 2 
				if( (tile.pos-neighbors[0].pos) in [Vector2i(0,1),Vector2i(-1,0)] and
					(tile.pos-neighbors[1].pos) in [Vector2i(0,1),Vector2i(-1,0)]):dir_index = 1 
				if( (tile.pos-neighbors[0].pos) in [Vector2i(0,-1),Vector2i(1,0)] and
					(tile.pos-neighbors[1].pos) in [Vector2i(0,-1),Vector2i(1,0)]):dir_index = 3
				if( (tile.pos-neighbors[0].pos) in [Vector2i(0,-1),Vector2i(-1,0)] and
					(tile.pos-neighbors[1].pos) in [Vector2i(0,-1),Vector2i(-1,0)]):dir_index = 0
		if(connections_count == 3):
			if ((tile.pos-neighbors[0].pos)+
				(tile.pos-neighbors[1].pos)+
				(tile.pos-neighbors[2].pos)==Vector2i(0,1)):dir_index = 2
			if ((tile.pos-neighbors[0].pos)+
				(tile.pos-neighbors[1].pos)+
				(tile.pos-neighbors[2].pos)==Vector2i(-1,0)):dir_index = 1
			if ((tile.pos-neighbors[0].pos)+
				(tile.pos-neighbors[1].pos)+
				(tile.pos-neighbors[2].pos)==Vector2i(1,0)):dir_index = 3
	
	return TileSprite.new(1,atlas_coords,dir_index)





###                         ###
### Tiles Class & Functions ###
###                         ###

var tiles:Array[Tile] = []
var tiles_dict:Dictionary = {}

class Tile:
	var pos:Vector2i
	var dir:Vector2i
	var type:TileType
	func _init(pos:Vector2i,dir:Vector2i,type:TileType):
		self.pos = pos
		self.dir = dir
		self.type = type





# Create a new tile and show it
func create_new_tile(pos:Vector2i, dir:Vector2i, type_name:String) -> Tile:
	var new_tile = Tile.new(pos,dir,TileTypeDictionary[type_name])
	tiles.append(new_tile)
	tiles_dict[pos] = new_tile
	show_tile(new_tile)
	return new_tile

# Remove tile
func remove_tile(tile:Tile):
	tiles.erase(tile)
	tiles_dict.erase(tile.pos)
	erase_cell(PATH_LAYER,tile.pos)
	update_neighbors(tile.pos)

# Update tile
func update_tile(tile:Tile):
	show_tile(tile) # set the sprite
	update_neighbors(tile.pos) # on the sides

# Show a tile on the map
func show_tile(tile:Tile):
	if direction_array.find(tile.dir)==-1:
		print("error: unvalid direction : ",tile.dir)
		return;
	#var dir_index = direction_vectors.find_key(tile.dir)
	var sprite = get_conveyor_sprite(tile)
	set_cell(PATH_LAYER,tile.pos,sprite.source_id,sprite.atlas_coords,sprite.alternative_tile)

func update_neighbors(pos:Vector2i):
	var neighbor_tiles = find_neighboring_tiles_from_pos(pos)
	if neighbor_tiles:
		for tile in neighbor_tiles:
			show_tile(tile)

func update_reciver(tile:Tile):
	var neighbors = get_neighboring_dict(tile)
	if !neighbors or !neighbors.has("front"): return;
	if !neighbors["front"]: return;
	update_tile(neighbors["front"])


	
# Find all the tiles at a location
func find_tiles_at_pos(pos:Vector2i) -> Tile:
	if tiles_dict.has(pos):
		return tiles_dict[pos]
	return null


#   r
#  rtr
#   r
# Get the tiles arround a given tile
func find_neighboring_tiles(tile:Tile) -> Array:
	return find_neighboring_tiles_from_pos(tile.pos)

func find_neighboring_tiles_from_pos(pos:Vector2i) -> Array:
	var result = []
	var a = null
	a = find_tiles_at_pos(pos + Vector2i(1,0))
	if a: result.append(a)
	a = find_tiles_at_pos(pos + Vector2i(-1,0))
	if a: result.append(a)
	a = find_tiles_at_pos(pos + Vector2i(0,1))
	if a: result.append(a)
	a = find_tiles_at_pos(pos + Vector2i(0,-1))
	if a: result.append(a)
	return result


func get_connections_dict(tile:Tile) -> Dictionary:
	var dict:Dictionary = get_neighboring_dict(tile)
	for i in dict:	
		if !dict[i] or !is_tile_connected(tile,dict[i]):
			dict[i] = null
	return dict

func get_neighboring_dict(tile:Tile) -> Dictionary:
	var dict ={
		"right":null,
		"left":null,
		"front":null,
		"back":null,
	}
	dict["front"] = find_tiles_at_pos(tile.pos + 
	v2i_transform(tile.dir,transformations["forward"]))
	dict["right"] = find_tiles_at_pos(tile.pos + 
	v2i_transform(tile.dir,transformations["right"]))
	dict["left"] = find_tiles_at_pos(tile.pos + 
	v2i_transform(tile.dir,transformations["left"]))
	dict["back"] = find_tiles_at_pos(tile.pos + 
	v2i_transform(tile.dir,transformations["backward"]))
	return dict



# O
# v?
# I
# return true if tileout oriented toward tilein
func is_tile_connected(tilein:Tile,tileout:Tile) -> bool:
	if tileout.dir == Vector2i(0,0): return false # take care of no orientation
	return tilein.pos == tileout.pos + tileout.dir

#   r
#   v
# r>t<r
# get all the neighbors tiles that is oriented toward a given tile
func get_oriented_neighbors(tile:Tile) -> Array:
	# print("")
	return find_neighboring_tiles(tile).filter(
		func(t): return is_tile_connected(tile,t)
		)

func get_connected_tile(tile:Tile):
	return find_tiles_at_pos(tile.pos + tile.dir)


# update the PATH visual to match output input
func update_path_visual(tile:Tile) -> void:
	#var from = find_outputing_neighbors(tile)
	var sprite = get_conveyor_sprite(tile)
	
	# var to = 









###                         ###
### Tilemap Functionalities ###
###                         ###



# A* algorithm
var astar_grid:AStarGrid2D = null
func _ready():
	astar_grid = AStarGrid2D.new()
	astar_grid.size = Vector2i(1000,1000)
	astar_grid.cell_size = Vector2i(16,16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER;
	astar_grid.update()


func _process(delta):
	pass



var virtual_pointer = Vector2(0,0)
var place_start = Vector2i(0,0)
var dragging_place : bool = false
var dragging_remove : bool = false
var current_tile_pos = Vector2i()
var previous_tile = null;

func _input(event : InputEvent):
	
	if event.is_action_pressed("place"):
		dragging_place = true
		previous_tile = null
		current_tile_pos = local_to_map(get_local_mouse_position())
		var to_place_tile = find_tiles_at_pos(current_tile_pos)
		if !to_place_tile:
			var newtile = create_new_tile(current_tile_pos,Vector2i(0,0),"conveyor")
			update_reciver(newtile)
		
	if event.is_action_released("place"):
		dragging_place = false
		
		
		
	if event.is_action_pressed("remove"):
		dragging_remove = true
		# remove tile
		current_tile_pos = local_to_map(get_local_mouse_position())
		var to_remove_tile = find_tiles_at_pos(current_tile_pos)
		if to_remove_tile:
			var connections = get_oriented_neighbors(to_remove_tile)
			for i in connections:
				i.dir = Vector2i(0,0)
		if to_remove_tile:
			remove_tile(to_remove_tile)
		
	if event.is_action_released("remove"):
		dragging_remove = false
		
		
	if event is InputEventMouseMotion and dragging_place:
		
		# Get bases values
		var hovered_tile_pos = local_to_map(get_local_mouse_position())
		var local_tile_mouse_location = (get_local_mouse_position() - map_to_local(hovered_tile_pos))
		var local_tile_mouse_location_normalized = local_tile_mouse_location.normalized()
		
#		# Find the hovered tile direction
#		var direction_index:int = -1
#		if(previous_tile):
#			direction_index = 1
#			var orientation = (current_tile_pos-previous_tile)
#			if(orientation.x==1):
#				direction_index = 3
#				if(local_tile_mouse_location.y>48):
#					direction_index = 2
#				if(local_tile_mouse_location.y<-48):
#					direction_index = 0
#				# print("Right")
#			if(orientation.x==-1):
#				direction_index = 1
#				if(local_tile_mouse_location.y>48):
#					direction_index = 2
#				if(local_tile_mouse_location.y<-48):
#					direction_index = 0
#				# print("Left")
#			if(orientation.y==1):
#				direction_index = 2
#				if(local_tile_mouse_location.x>48):
#					direction_index = 3
#				if(local_tile_mouse_location.x<-48):
#					direction_index = 1
#				# print("Down")
#			if(orientation.y==-1):
#				direction_index = 0
#				if(local_tile_mouse_location.x>48):
#					direction_index = 3
#				if(local_tile_mouse_location.x<-48):
#					direction_index = 1
#				# print("Up")
#		else:
#			direction_index = round(((atan2(local_tile_mouse_location_normalized.x,local_tile_mouse_location_normalized.y)/PI)+1)*2) as int
#		# var direction = direction_vectors[direction_index % 4]
#		var direction = direction_array[direction_index % 4]
		
		# When holding mouse
		var hovered_tile = find_tiles_at_pos(hovered_tile_pos)
		if !hovered_tile:
			hovered_tile = create_new_tile(hovered_tile_pos,Vector2i(0,0),"conveyor")
		else: # Changing the existing tile direction
			# hovered_tile.dir = Vector2i(0,0)
			update_tile(hovered_tile)
		
		# When changing tile
		
		if current_tile_pos != hovered_tile_pos :
			
			var poses = astar_grid.get_id_path(current_tile_pos, hovered_tile_pos)
			for pos in range(1,len(poses)):
			
				# Change the previous tile orientation
				var previous_hovered_tile = find_tiles_at_pos(poses[pos-1])
				var orientation = (poses[pos]-poses[pos-1])
				if(previous_hovered_tile):
					previous_hovered_tile.dir = orientation
					update_tile(previous_hovered_tile)
				else:
					previous_hovered_tile = create_new_tile(poses[pos-1],orientation,"conveyor")
					update_tile(previous_hovered_tile)
					
				
			previous_tile = current_tile_pos;
			current_tile_pos = hovered_tile_pos
			
			
	if event is InputEventMouseMotion and dragging_remove:
		var new_tile = local_to_map(get_local_mouse_position())
		if current_tile_pos != new_tile :
			var poses = astar_grid.get_id_path(current_tile_pos, new_tile)
			for p in poses:
				var to_remove_tile = find_tiles_at_pos(p)
				if(to_remove_tile):
					var connections = get_oriented_neighbors(to_remove_tile)
					for i in connections:
						i.dir = Vector2i(0,0)
					remove_tile(to_remove_tile)
					
				
#				if get_cell_tile_data(PATH_LAYER,p):
#					print("error")
			current_tile_pos = new_tile
�~�����މRSRC                    TileSet            ��������                                            �      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/next_alternative_id    0:0/0    0:0/0/script    0:0/1    0:0/1/transpose    0:0/1/script    0:0/2    0:0/2/flip_v    0:0/2/script    0:0/3    0:0/3/flip_h    0:0/3/transpose    0:0/3/script    0:1/next_alternative_id    0:1/0    0:1/0/script    0:1/1    0:1/1/flip_v    0:1/1/transpose    0:1/1/script    0:1/2    0:1/2/flip_h    0:1/2/flip_v    0:1/2/script    0:1/3    0:1/3/flip_h    0:1/3/transpose    0:1/3/script    0:2/next_alternative_id    0:2/0    0:2/0/script    0:2/1    0:2/1/flip_v    0:2/1/transpose    0:2/1/script    0:2/2    0:2/2/flip_h    0:2/2/flip_v    0:2/2/script    0:2/3    0:2/3/flip_h    0:2/3/transpose    0:2/3/script    0:3/next_alternative_id    0:3/0    0:3/0/script    0:3/1    0:3/1/transpose    0:3/1/script    0:3/2    0:3/2/flip_v    0:3/2/script    0:3/3    0:3/3/flip_h    0:3/3/transpose    0:3/3/script    1:1/next_alternative_id    1:1/0    1:1/0/script    1:1/1    1:1/1/transpose    1:1/1/script    1:1/2    1:1/2/flip_v    1:1/2/script    1:1/3    1:1/3/flip_h    1:1/3/transpose    1:1/3/script    2:1/next_alternative_id    2:1/0    2:1/0/script    2:1/1    2:1/1/flip_v    2:1/1/transpose    2:1/1/script    2:1/2    2:1/2/flip_h    2:1/2/flip_v    2:1/2/script    2:1/3    2:1/3/flip_h    2:1/3/transpose    2:1/3/script    1:2/next_alternative_id    1:2/0    1:2/0/script    1:2/1    1:2/1/flip_v    1:2/1/transpose    1:2/1/script    1:2/2    1:2/2/flip_h    1:2/2/flip_v    1:2/2/script    1:2/3    1:2/3/flip_h    1:2/3/transpose    1:2/3/script    2:2/next_alternative_id    2:2/0    2:2/0/script    2:2/1    2:2/1/transpose    2:2/1/script    2:2/2    2:2/2/flip_v    2:2/2/script    2:2/3    2:2/3/flip_h    2:2/3/transpose    2:2/3/script    3:0/0    3:0/0/script    3:1/next_alternative_id    3:1/0    3:1/0/script    3:1/1    3:1/1/transpose    3:1/1/script    3:1/2    3:1/2/flip_v    3:1/2/script    3:1/3    3:1/3/flip_h    3:1/3/transpose    3:1/3/script    3:2/next_alternative_id    3:2/0    3:2/0/script    3:2/1    3:2/1/flip_v    3:2/1/script    3:2/2    3:2/2/flip_h    3:2/2/flip_v    3:2/2/script    3:2/3    3:2/3/flip_h    3:2/3/script    4:2/next_alternative_id    4:2/0    4:2/0/script    4:2/1    4:2/1/transpose    4:2/1/script    4:2/2    4:2/2/script    4:2/3    4:2/3/transpose    4:2/3/script    3:3/next_alternative_id    3:3/0    3:3/0/script    3:3/1    3:3/1/transpose    3:3/1/script    3:3/2    3:3/2/flip_v    3:3/2/script    3:3/3    3:3/3/flip_h    3:3/3/transpose    3:3/3/script    3:4/0    3:4/0/script    script    0:0/animation_columns    0:0/animation_speed    0:0/1/flip_v    0:0/2/flip_h    1:1/1/flip_v    1:1/2/flip_h    3:1/1/flip_v    3:1/2/flip_h    2:2/1/flip_v    2:2/2/flip_h    3:2/1/transpose    3:2/3/transpose    4:2/1/flip_v    4:2/2/flip_h    4:2/2/flip_v    4:2/3/flip_h    0:3/1/flip_v    0:3/2/flip_h    3:3/1/flip_v    3:3/2/flip_h    3:4/next_alternative_id    3:4/1    3:4/1/flip_v    3:4/1/transpose    3:4/1/script    3:4/2    3:4/2/flip_h    3:4/2/flip_v    3:4/2/script    3:4/3    3:4/3/flip_h    3:4/3/transpose    3:4/3/script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping 
   sources/0 
   sources/1    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level    
   Texture2D !   res://Ressources/Path_Arrows.svg �'�&��r
   Texture2D #   res://Ressources/Path_Conveyor.svg ��=GԻ}   !   local://TileSetAtlasSource_sou63 r      !   local://TileSetAtlasSource_bcnuh �         local://TileSet_ycsny x         TileSetAtlasSource �                   -   �   �                      	      
                                                                                                                                                                                               !         "      #         $          %      &         '         (         )      *         +         ,         -      .         /         0         1      2         3          4      5         6         7      8         9         :      ;         <         =         >      ?         @          A      B         C         D      E         F         G      H         I         J         K      L         M          N      O         P         Q         R      S         T         U         V      W         X         Y         Z      [         \          ]      ^         _         `         a      b         c         d         e      f         g         h         i      j         k          l      m         n         o      p         q         r      s         t         u         v      w          x      y         z          {      |         }         ~               �         �      �         �         �         �      �         �          �      �         �         �      �         �         �         �      �         �         �      �         �          �      �         �         �      �         �      �         �         �      �         �          �      �         �         �      �         �         �      �         �         �         �      �          �      �         TileSetAtlasSource �                  -   �   �            �      
   �         A          	      
         �                                 �                                                                                                                                                                       !         "      ?         @          A      B         �         C         D      E         �         F         G      H         I         J         K      L         M          N      O         P         Q         R      S         T         U         V      W         X         Y         Z      y         z          {      |         �         }         ~               �         �         �      �         �         �         �      #         $          %      &         '         (         )      *         +         ,         -      .         /         0         1      [         \          ]      ^         _         `         a      b         c         d         e      f         g         h         i      j         k          l      m         �         n         o      p         �         q         r      s         t         u         v      �         �          �      �         �         �         �      �         �         �         �      �         �         �         �      �         �          �      �         �         �         �      �         �         �         �      �         �         �         �      2         3          4      5         �         6         7      8         �         9         :      ;         <         =         >      �         �          �      �         �         �         �      �         �         �         �      �         �         �         �      �         �          �      �         �         �         �      �         �         �         �      �         �         �         �      w          x      �         TileSet    �   -   �   �   �             �            �      RSRCE�biK�rl�GST2            ����                        �  RIFF�  WEBPVP8L�  /���(h�FJ���{ D��G�;�4�9j4�B䢁&m�n 嬠�A� eu�w���^I���m��Zv���8k轌�YD%$��
B�> ��pض�#�R���{��mI��i���xv���صmSc��>_��(I{�ɀ��̜�0333s{���1ť�|q�@_���RKK��~��m��m�V�c�˶m۶m۶m�k۶m�Z֘�{F��mUmֹ�慥���?�$IrI/�D����Z��^�+?Pf@Crje�۶M����g���߶j۶m3��+��?�7�I��;wK�?�dm{��Ya5{j��,}2�qv �:�Ǯ�6�I4�v��O?
f���d�L/y��*.�?�m��O���?���/��-d��\+eI߲���e�++���Y��I��?f��e��h]�~@Wҥ�����W� &�~>�Ƶ%�O-�h���L��+��=�~�]�ͯۢ}Ե�Lu��û�	o�K�xծ�X�������ȮТ���nt�x0 ��0J��-�κ�kuu�o����B�庺Bq�ڒ����?_]<nu�B]��nB��`p��8Ֆ��˥
C�CA��:��
�ҽ����-O�����	kk'�W�8Ե@헎��]^!������G�
3����Du����>筩��%<RoR�s�����0�u���^a��u��T�z�ǚ�}	�J^�J�
s{gwI�0'��]iQ
ń�{�c�2y\З���頸>ٻ�cr���O�P(t�+-M�	aF���e�>a8���u�V�㜵������KS�'���>����v�������=�X��=�ᡘ�y.˻d�������p[ޣ�vȣ�K�+�� �c����Z�W�aYZ�)��HW��C���9kmǜ�s��A1K�]��4�El�ę5}A�䞵O����g��f�1vm�]l�]��c��i��ɳ�Egߓ}�k�+��9���26�6&s���d.�9�dq�v֘��\�|���Ga_/}�����o���B����c��^�d�)����c���?��O)U��;[a��$8�&���jIp!�
�
��^��;!$c�gl�>l�e�sBNc䠲��c;�ݧʳ\kN5�{ʭ��m�n_�ӄ����͍�t��-أ�n���{������{9Ǟ��K����҄�:���K��W�I�c�썽�gv�O�*o���!!���QU�!#s��q!\��z���C�N3�Xc�!sMy���!������S���O���?���R�)�Mݯ�ޤ�r�J)���|եI;�\U)��RfMJ�TJ�:�2�I9��.�z�Q�m)���)~#�K�S�B�N~�m���{i~�__���9������8���6[-�d�/�,��d��8�������D�w���DI�4��|��'��w�wV�F5��{bY�m(1/����)�B6�L�Cx�?c��+���Y8�.��7�T$�d/>� s�=��#��<���qȧ8���D�J�{���.�m�
`v�b��J��Q��<�1?�����~R/̓Lf��T,�-�;�`�Y9�Z�e�bay����b
w�|�3���K�Vx�@d�R$Cros���p����4�TF�?�	-�Æ���1v�ӽ�ݾ�~��|�O�kn���<��U�*�#n�J�5?�q�q�{?�m�y�g��e;�h���!��9�s��~'ؘJ&�47�w������nw�_�� ��^�A_�N�f V-�/���u�l�� ��ɼ=����� .�����V��э`�J��EV�n�lll��Ưß�����q<�����5L���Evg09�O�`cc.
Д!��sԟ1�H:_pD�/ Z�{5X���p�ll�L�����{�7�X.��
r�.&��z�	i�1�N�ؘ�3�`�����?�9�Ǽr�dI(V��ɼ�o�icV4�?}����F��d��KL��d��`)b���[��$e�������z�d�Ԯ ���	�ocV��q��+�k\t#���r�%�X��fU~�����ڨԥ>n���-3�y����{ܾz
�
�*��7�bc������p��~�d����f1�4�Pn��_]*<�����?b%%�+�VC\�ݎO*w,�wak���^����#��srψ�|q�^�i֫н~����hS�����0ď3;�Q��@>����ş�Z����$gd���a��~�9�w͋�D���
H[�̏=�m<i#J��ng�l
#;�)f6+�-���t��	߲1;.�ka|�4��0��+ mq�^�.���M3��6�몉��Ml�u�VS�pEmă�]���ّ\iʉ��B�mL�iC>�G��3�����^3�j:��;�ܬR>\.I�[���R��,��w�t\�4��i�8��r!�bɫ����qI1��]m����`:�����V�`�d]{�C��#�#�ŭ��!ID|и�ƌ�|���ƛMkx�g�U�+MR�2�8e�)=%�[�j��%��c�^L�����=8ˁN��Z�*r4���0�`T7	R�v�3��G�H)��WH^��|�)MMD<g|��Orr����f�~���$9R6c����㖫\���9���)�	H��'T#j�~��x�Q��Ѭ8����x�$0�9�w��9�S��YɠN�o�C{������0}�!WH1Me��;��ğkK��;���o�����7�`���4u,l�e�!C<�}&�zT����J��'I��t��v��kk#�'�w��o%�����^@c6��J��)�^m]!�+����0��n�	)�B�2_w��fŲ�7cҙ���e��kc�YA���|���=(�LH1���#�ۧ���.$_�_���!� $_�z_��gwB�\���O��o���ৡ�m�/�ߊ����3�?3�<)�\�)�o�s�w���Ӑ���1Nϟ��~�f��eC.4�j�I�b=�.��f��8�z7}�S_9��l�uƞ!�Ik�c�i���s�z�ݟaȣ�(_!\����_{(�R�W���+{}�J)>$��#zc�{��R�\�"z!�>��Q�*�y�,�>����d�����gV�/ԺS�;yr��s{�_w.~�8�N�2�N;�Q֝Fe���;�1֝���;�c��|͠ugg��睙Ռ,R�|:���Q�}d(����C�12<����[��!�e����cDF���3]ʁ�3|�7h�q)�<�2�w�a�J�-�����6���l�_`p9Ŕ
)FV0��8�jM p����c4�C~���7��l+���YC��.D|:�ml�}���r���U8�x�����/��Ak�@@����|�:���K��?M>%I�s!Gw����/�oo1�S�Qp�=��y=?�\6d
ӡs�ǌ.��{��Û`�-�#�t~o�߹������r4�%]1�M�2S�c	"��L=O*��/�ԪC���0*��Q�_���+��F�+v�o��@~�w�����4&QL�ؖ7OrɌdK���y�t\q���xT�T1:��#)F��+ӻ�s`�WJol��tTq���?a������8�f�˾�-r�ܒ̄΋�4�g>L�-�9���7���t�ҤS�p�ȣ0���"����M����#�Z@V�Z-��v'��6�q�W��?���=��t�%R�&�U)r
L�����V�
������"�߇�[�8�P|&/��!0�c�ȶԪ������Q����f&/L`��bGR��.�͏Q詺� ����VÒ;��l�b�g`�k���I�|�;'�!ߓђn%��b��6?Df�j���W����f��_��R+$�Cٜ�<��E���jUކ��P;e����=Ռc)	 $L�?��[tf%��ov�ҡ��_�~��Ca��`>b�s왕@"�������=�( ;�#���@�kn�� �l�D�S������HгR�V[3_�y�5���E�n��Jȅ�����1������#h��D�̎���X:�e63�8�d��x4�w�lmQ��w�㮼�c�pɧ<r��eN���K����O�_��3AK����8��wC=�~O�lx]v)
MX/�'>�O�'���3�!h��ȳ�ɳ|�#vw�׽ z�7�%$҄s��&�@.d6zo��_�`���1LC���Sg�~�>G	�Enbd]�&������Yy�����?��Ob���ݿ~�Y��a�<�K�ϗ�q��ٯ���|ث<�@���T�+��'�������jd�}%��Ā��F��y2���TX8I�s����1G!h������<�m���e�HX:���d1���9
���Z�3��z9jkS��u��Oݥ�r����d1����8x���%����XU1auş����ؑ���m�(��<:����C�����N���C�ED��G��tA����}�jw�C��H�%I�h�V��4��S����|�0wZ�� E�."�p�|�����Uy��e����t�eV��ikKe|���"�qr�\!Ol�T��`Z[�D1�Z���p���\͹�w��M6`r�KHR޶���iUU�z��7?�-R�v�\�7Q=e�l+�dUMʡ�Q�G��0�6mmSt�z��<��SU5-_g�{����O��_|�ڏ4�?w�܇�Ha������ܹ��l�,2B��$ID��C9���iȝ��)e�R�9)C�6%E��]�N.�S9����n���n���� ��
��qNjVl9m1K	�����h��RY� 0C>��ʴ6i�����/&� L��ۥ�vB)`�<�.�[�2� �%�Ȉ����a��)&~�=�[?�Mw{�g�?��vVl`��e�2��G	'w�w�wT�]̑KdH���=�枀�c����|�Q�|�]P7�=��t��Iw��W[h	��}\+[�,S� K��2wp'W���\�P��!�}�K ng�R�Ge�
��T��i��xs��+W��M6��&�8I��dߡ�q��V%�a���؟�>��H[��.6�70�i��ĵ����ȅڪ�;�,Bɺ���?C?��`"ߓ!�a�Ҿ�����;��j��8�b�F�-fq��:��CR[iQ0��E��S��.U���=t���a�w���ƇLm�E�\�#�E������=�R�ٸ���\O�O+Hα{�;-\w��i�uu��TU�Œ{�}0]Qݶɍ��wJL-	D�&��w��;X���{��)ɑ��&��$���2�q/��N���Ĉ6���>Ch��ꒉ���w�ؒXQ&�ܷ�N��2�qwf��c�yx���'�G��=
���)�����'�/<��&;n��I��AiJ0m79��E_M��/%�wM	��8�wܚ�٘�)=d~z��ϸ���{k���a�	�&B$Wo;59\�B�/�_:L��@�����a��Nܲ�~$V쓯�s/�?����;���x���C����珢��K�0d)f*�N��mN�{��������o�j��������и遳�G���S��^r�?}����zt9��Eq������;��(t�_������J��'�Cś{��w�ݞ� 9������y��/W������mǏ�w"���%��3���=���{'Bm�A��O�J�}�̕s��h{'��I�#����O�3�t��s�sp���/C��w�G���{d	���u�p�;�3�����γ�S�ȥk��TV���6������X	z��O�ʺ��������;���#�y_�1�u_W�c���c�����\��)�1���h�E)&.��ns��Ρ�[0|��)&{��������`�K�5�3�h������%�w��!V���Rm1YX�}B͝�މ�k���iB�m��r�����w.[�<�����h<B�)�_���{����;�wo��u���dn��)5�ֲ3,�����L���;��
����Aϒz��0��=�b�\1Kܽ��o7�5�{.jr�$Eۖ���G��R����N����ИQ-Z#m[ܾ
�U-s�T^c>J�-m�g�ᎍ;�#�};�7���ܐ+fy_<�Y�E���S��\Jqm[�^h�"g���ϖ��$R�����Y����].iq�I���}����B���a��}̳ ���:m�1�'7|U�H��͉f��mL�4}���38�C�9�^��t��4����
���n�IS�i_p;�D>�|�bh~��>�yz�,Ε��҄��V��?����x�#�C�kI�·�Z���Y���-`�5w,C�&��f�)�����1�'�Q�ܨ0��b���ߚo��jQ"���o��\��TU�J�l�0Ϻ!IQ�>s�b�/�QUzĂ�?�<(G�KQ���Ҫ�-c\�9�A��_�	$��֖��m,$��ϧ�r��l��ǀ<��4��g�u�K�v+�\�6��嶄ȅ[nR��� �U��_;.#�O���Κ�������&"��hz����Q��&N���3��S?� �4�U�."��=C���o� w����E"��4r��#։������vFe(�����F��~��ϝ��7�[x��?����8��N�T���~�dWWJJU��"�mjI �6��wS�#e;����:w��mto#�e�w'/sWޱ�����T;s���5�����$����4%�vFz�r/eqNB���;�*zs�f9�&��\��xy�=���%�������{w��'z��>3˽/ܰ9���khӷ�߼�~���o�r���O�Y�}�����b=�.槷������%� t�3����Y�{�BV���f�Dۛ�ʎٻ���+�Ǒt9���Q�s�k����{���wY�%�k/f�{���$`�<;>E�����:��[9�{M��,�ަt���os�����S�c�vT��(��[�Wم��(.eg��,s���r�m�fzwo.[�<�m��ߛ�6���woJM���Z7����[��}�YeT|T�ȧ|w����u�]�75�js�-5 El���[Z#�K�1��ƹ�&��?�Y�"l���q3�=5����Phz���<3$�N�) �[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://od7daag080bl"
path="res://.godot/imported/Path.svg-34733e0df181de450e1f532098e86d8f.ctex"
metadata={
"vram_texture": false
}
 GST2            ����                        d  RIFF\  WEBPVP8LO  /����8r�F�$���Օ��g�E��r-��T����m��Yr_X���h�,� ^S��b�ZSm$وJ?U2�Z�xt��*7�mWO��+W�QH�4��-[�MI� �"��I&|��ߜ;����mۉ6���Y�@~R=
F�(ȡ@�F��u2��{'��ɑ$E���bh��n�Z�T�!TC�B�M���������N�Npw�%\�*ᦹi��}�g�q
�y>�����7;ɢ�nc;��j�j�A�{�ڶm��i�935��9q&�μp#@�|�ݓ<Ag��H�`
��+.0���.%�{�%I��H���,�{��>����i��{	��n��4��H���BI��f&=�3��:�ˤ�p�f��"G��*�¬��Oy�}>��|�����e���
�gr"w/�
�2w(�-s(����@m۲�y���1 r�rJ�V�C��:eR��4!s�bu��������?�p؁��I��,<���H�"I�GÕ�������'y�(B4v:����.�yg|9v7�������0E�;8 px��� � *���@�[R��2��W*/.����9���gi{7���N��\zF.�M��] He-�ڕ�#b�T���fk�����e�Y�B�w� ��o��<}��PH��9rNFPN�۴@!���>z��Qa��ɋN7y�R&��ycYDj,"o,}��# �tH�{��:Q,KxUQ���[�ƪ5ķ�����K���������6x���x櫛0E�(혥�s�X��%�>y���*�`Hf��Siyg��������$NZ�8����� Y��x��.�H�|=�n�nrm?��\zr�:G���J��@L��sS����_��]����N�얖�����G�{=9�E����\_��8�}uW�����o���]�x���˻_;g����J�ܞ�(��"D�xj�Z�+�������_k�v�\Iv�?��?��?��?��?��?��+��9F:�{ɫ��NX��<H!��Cwg���y�=�D��N�
S�_��B�B��ӊ~���;���;8 px�n� �^��3�  s4X��A�AT���e2ߋJo�Wg��+�~e�����Ĳ�e{��2�(��-��}���J�ť�|>�q�k����:�l�����r !CϢk�v���� C��� 	��׻�`ȍtT�fmc�}`���"1�޴��\zF.����WZ��9�)L����V�7���@��"4]�'꽸M�����˫ve��|������K�y�w�(�;��C�"z����3G����{����eĽ�=��^��
Ĭ�W!����VKp-=>�<I��#�;� I�7�3u'�D�j!;�; Q���p;O_ i.��*�E$���57� H�jf�s2䜌�1=�H��|uCK�����fv��6-P��h95@!���RY��QǱ���luT��|�BI@��;��z��jWv+�;i8��= J��%kVR���6J�h ���V���Ʋ��XD�Xt��IF#5�����*�U��{�|��# �t�����}V�@F�u E-��p���*���r��Q�����_%���)�M��j62�gU��mm�!��[����[����N0a���w�I�%�W�_�U�U�獛b0���$��7m���s�I���ݮ<�G�7'I���~��� л��S$����n�b�@�wm�0o��$h�����M P-��^{��	��� 헪/2z=�$��ZgkWp� b��޺e�1`@�WŴD=qN��V.�?P-g�s ��Zx��2LR�%��� ���^ �j�1@���bL�-���2uøAM\@�b.H�,�+9x��6�&uB���> P5��_ ��|S��o�5�6*;C���C����,�f�d,F���̑� ��f	��
�s�\���F�� ������KK��2��F95�d6�˱a:1����;�Q~��R[��t)�h6/��R5�ȟ##ރN����X�'7	cr�<q%	�~aD��]e�R�*��� �Y�\`�"��Y*^e�#�"W �ܴ9;�H��
���kj�ӓ���>n�z�� ��Ixn����A�
m5	h�����NZT�������m��SJ�	\��b����o'p��;�]�Z��݅H��<�����P�D��8�忢�;tA���
(���T�����������}�T�耔� ��?�E't[�J�U���U�8P�w&̻]�I p&��5���~�@��`H�G!���C�&���{'k�<3A�����ј ӟ�'p���^��T�:6+�h�DSp���`�	�b��tړ�%p���k<b�@���tV� [�6E�iB�L!�yoL3���4b6��^�\�I�6g�Э
�֣�3�`	\E�V����Kz��W��õ�(q��H�6���s�����.�>��f����b!M�鸰*P����|
o�[�J��m�!���;/v�g2���]He����g�t�Z�r���
Y@�����>ݯz�j�|�W�qf�d��޹GJZ�I�r�dm���e�r3�O[���S1nv;�_(e�ٟ�)Ab���f��}i�����
�[T�W�_�������{�Bts?ɃD�}���@M@�M/�'L)��a
q�O+�!�B�w�;8 px�n� �^�~���w�g�g�w@Y�L���қ���ޕoI9@,K�P�g:@,���߻��|���Ry>tոȵ��KA�w�r !CϢk�v���� C�wջ�`ȍtT�fmc�}`���^���3r�hD��
`�ʤ���5ow1� �Eh��O�{q%��K^�+;G�ΩvE�����K�y�w����x�� ��Ѡh�<�ރ/�߻�e�Y�B��ٓ���Z�����$�虺@�}�������/�4
QS�"���U�~�b�s2䜌�1=�H��|uC�w�۴@!����P �̪B�w����VG���'/����S������t�� (e�n��YI�w����.t�X������;�h�p�?���\�G ���c(*��^�~�*�4Z�u�8X��"��P�OG��Uu��&�}5��5�GѭZc��xN0a���7�������ո)��L�aoU�,]���s���߳�95���9��z�nWu�2��0��LB��
�ݿ_o�
�7'���~��� �R�	�>i�{,�v�^��+`�؜"�ۙ�w�+0 أrZbY�JP��ݿ��z�W�y�,&��|m�Mn��l�)֒��{ a���Q��Z  Y��޴g����J{��{KV= ����c<}�)��f��i�T����a'���f/���2�o	���!E?\�Es��y�~0����� ��f0 ثbZ�;9'�i+�X霵97�(?�P�b�*Aq�]%R$��-�w7����|��>�~Z��`�����PI�=��~rl ¤H<}����O�D�;���+��)�<�t�5q�
`[�v��92����&�$٦h;�j���2�IY��k���&���Md���� (�����Gs7@,ڤK�彑|b�	�|��"���A~�"��u�n��㙭%�W3���@�WM3�o7`�,a^ PQ�Z�,�(�1��~}K �-P� ��zd�4�`q��ޑ���KK��2��F2_�K>��p���o�-3�~7��������W
`h4��M<�͉q�X4XuSC液�m�'���>Y�D.���z��ޮ,U���"c<1�92�=��
�ω���,�(� B�I�0��,|c���&�g��) _���/�����H>j��WY��	]m��&h�rx9Kmw��aۚ���uGg��������f����5�Z��I@��}�.Ÿ��sI����K&���`Ѧ�̶�;_� �ڨh�I�ʶ��z�q����V��%�zK�7���F&�u�Ϩi��eJ�t�\�@.͵[L��;>*�F�푎JV��b����o���}Ƿ+<�|�K���	������[I�w|)��/�K��٭>t�m����Pغ�y�Du���x���v�U\�%����%J�7�e���h�4w�3�E$|���$��M�Vv�qǟ�:�\��H	:���b{'t[�H��^r�S�M�Ge�r��g����,�_�x������n�k�J"�ujt�$\M&��5��K��]�s-?�h�K.�佉�މ:C�1L�1 W��%Lܱɟ���;0ɀ���ET�����S���]A�����6+2�X�4&�����8�#{E�R5�- ثbZ"�\�ބv�����B4��M�N{r�Ly��FNHc�FEE�5����Y�l5�*X��O�t��?��M�f�	&�nU@��*1���^��&ۜ�Ta�4�I �O�����I5�`	X{�핮��h��'>&���W�,]���|� ���fJ�/��"q���.���/�$P����M����YT��@��IS�GwfS���
j1�-��B�~�Q}�w�5C�%2W-o�^f�lS��YM��N�� �N%�Ů�Lp��ꣿ;�i�(U�}*y�2��;�uU�����83P�qfu��G�Vɹ������f�M\����2u(i�'J��ߝ�d蟶�+AJ��Ed����Qr*��.b��ꣿ;�<� ����ޝf��@���ݓ�K�/�?��?��?��?���q?ɃD����繯cշ^���	S�_��B����  8<���w�g�g�w��-)�ei������X�oo|�Ryq�<�}o�9��=Kۻ�`ȍt�^���3r�hz��b A*�hyծ�;�ڕ�7[ ��e(�@�*xB�s� ��}�v�� ͅB�]P�ɐs2�rzݦ� 
ټ�V�ћ��
[�O^t��{ �2y7���"Rcyc�s�(��C���h׉�`9X���g�wݪ5V�!��'���_�U�U�W�_���)�X>sd��:e��)�;Odk�`*�}�~�J����jϝ� ���$��	]�:j��wW�v�|�6�H~�
�/ZX+ �,�TJ*��X��YL���*�=_���-����c�E�5 ����;6J�&9w�b/A�/U�}��'�_"w���' C�W{�@t��U1-QN^��luL�h�
 HZ��Ν�05hH�����D$Miꙸ�$���ǋ�;a���L�OeG�5�0%vW�� I�t�"����jsn��s��� �6�9H�aG�X�m��3Tv���_����o��,�S+,F���̑]3G�o�K��59�jl���s e����r����� �s�&�Z��G��@R �_�y�#ƝbM��x����n�,U���"c<1��"_��T��	'8�lRz��`� ��g����U�2R'����Y��P-Qkݙ�8��m��7W�aȔ�D��B��Fe@�MJ	��46�n�FnFΕ"%��%�^Ӡa�)�}�G%�h�=�Q�V%�[MnРi���v?X@�x�ͼ�b��g�}�g�	l��c"���~[�Z&p���P������sg2����?�t�8����Vv���<"��̥�X�s�0a��rM��H�Fw��u�h���H����������C�H�j89Ɛi��Vx��%�?bv����f%@�+��K�F�
������K��YK�=9Z�<MH#'�1OC�����[��ܝ�4sN0�u����$`�i@�j��tw�2�`	X{��N�f��S���*�2	q�8�I�S���`>��f�6�vg6�0�X��@�k2��k��J4d��ɴ;����i����i�T�s�v��R�ۧiR��hƙ���3�\��Ch��&.��e���e2�O[ɕ %H�"2�Z&��<#���IS�׶}�vO�/鿤�����������o�CGtM4�_������������$� W�#��.☞~9C����v_⛟����v�磟��A9O�A�;��:-2�5�W'_�f/Y �f��
�=���K�|�}��R�C���
��"w�j|pS��m�����%`͑M2��ٚ9'�غm���L��ч1�����$q�4!����Ok�9��Z��@�0�?lN���Y���jB�y�V��
�/ZX+ ����M�����H�F˱6o�� x���HW��1+��n�{�Z�	�g�� �j���.��(r�<X��}��'�{ULK�|ы�/  S���%��S��~7�)֒��eX_�/��(�H�����E�7�]*(r���u-G a�����p1�g���+��_VO5�`qRM �� +A*�4��:��f�_���2Rs�~;W��w��.�9W�D�b��[��[L)	?X@�x�wɢ$|���s�>�3��2��B�د߶�Z�u�-A�\+���CyDN��K�dA`뀔Vv?\�w�\�@`W�������C��xH�\&zw6�o���3	cr�x�w�]$'p�Y	�
��m�Q����%Q�f�}m���h	��4!�@���<S���n�Z3�[�* [�J������M1D�^�@A{���cz���2	q�8�I���@PX��gW���
��!������i��������J�n��n�(�8�o���%��� ��2�O[ɕ %H�"2���蒦&M%`���꿪�����������o�[��h"��#������������������������������������������������������������������������������������������������������������������������������������������������ u[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dp4v86ob8fppn"
path="res://.godot/imported/Path_Arrows.svg-3d5516653b8e63b2aef2f6c7852d2088.ctex"
metadata={
"vram_texture": false
}
 Vo�
��GST2            ����                        �  RIFF�  WEBPVP8L�  /�� �(h�FJʟ�>�!��	�(����d��Ёc*_�+1t��K:��VT�x|�}~���6�_�T��:��\h'a^̎+�
	/$!��ɫ��V_�[��
��⾒M^�.4�܆j�'��)�}>��a���h_[)Ѷmj���m�vz����6�v�U-۶mƶ��Nޥ ����y���Vr���K.uwwE��l�Օ^fȬ��-��ݍ0�IRW±z��4\��?I�$�����=��(]�vH��D[��Ƕm箺v��]�nl�m۶����S��"�ɸ�g�I��팤/Nڶm�۶g���l,G+۶=���x
紭�e[۶�m��f��G�¬�m��Crɑ�8�o�����mm�rpw�*%�H�7��i�p��J�����g���}|�ɶ���;�@� h�PCf��z��\P�m{S}?��Iwm�: d��� Q�X���9�Q.�����@��7�[ r����������+#�5{�D�&�5�Ζ�r�ӆFd��Q�ِ#)�U�(�(����X�]�$@ܼ��i�79�,
^"���7��!�� j$���|�stfq�Fj>�k�"H&81��7Yt
@`T�'�t5��H��XV��s@�`l���~����e�ng ��ҍ�C@@��n��Da]�㺞����[2��N,َ>���t��Ni�& (20�- @m�Q(@!�S��\�N��������#�݄
�﷩��}.0��Mn�e�u @���������Y��f�Dğz�i'��-i��Ϝ���&���� cT�sn�y���e�[\�����d;\�m5"��ky� ]���f �.��ݛ�|;>��Y��t}mڞ�7�<�9pV�Ջ�݌mmj��3�l���$�]V�,<���͓��{	�#4K�-��SA��^����=�9MM@��W�ߟ�q��ͦ)9�������I䡼��/����/����{�����c_��� &4k>���m�ST3��g+�@�˼��p��?B�n�v�z����v���� N���G#E�V8�60�D��6h��?��,��a�{nNG��ׂ��!���f�81��f{���k�i�����\�ǊAL4�j�=N {�i��1�j�w^yէ�Ą��C!�x�5N��_��j���������#F�����%��z�y�.�� ��hE��0w�l�lhr��v�V��GO�Ц��"k�oVS�+�0����j���1!�q����������%�y��x�/���b��S��p;��Y=�
�
d��v
D;���+q~��Ջ�-rG��Y6�M����~.�jq�vˏӸ��u.1�W:s��Y.��Y�p|M��ߟ����E�k�:{��Y�V�1'�m]6��u�;���Fՠ�[Y�| ��]B�ʆY�Քf���QF7/��E��F%!��5��Q��+�{�.̖c3��*yu5˭�1�5ۖS{.�� ��˥uYD�r��
ʝ�k�R/�Y��/"�X���\Y���rj�9��$b� D�k�ry����������6fQ�}��ME7ҜOW��3������݈��r�oeܧ����3���00�f��C����������
hW�t���0�bGy�l���3��q?d�s��Ϝ�=1�faп��)�>4�T��g��[B������:`������~Q�E�H1X��+V���t/��륫��+two}k�ݟ���Z^��=^�*�ZY a+K����-��/����G��ݽ	TĹ�V��jD�݈����-.ۃ���"v��t��G�8��Z��O���~S�x���	H���p����{&�'�!��A��K�Aɫ��"�V����
���/��~�:��{��zhO��0�ⰽ��v?)O�h���Dk����\<O�g��������4\��:��=����f�f�D�[8����8��v����@�ݼ�`��	:�&�TEZ�?�w�ku���]�	��>��tob�b=i��+@���ˁY�t�q�iO�;�1��J�y�DFa��8�3��42��#)�`�j��v�,G���GH�G���/zY�R�U��U�R�잪J���1�xc\����|��^2H��_��z��[*�/�D������I��ǵ�z����#���X?�J�����8������|
j�}ˤF΋X](&���+Ἣ�;2��N�Kw�_�߿���1�lP�'�Jdl��^�j��lI,7`:mh @����9��Y��]��yw+�Ӳ�!�� vI��aMR����� Xƺ �u=�)m� q��N��N��"��:�
xz�%�f�9#z �p�OJ�aW�����587̒M8�^4 �^@���J�h�-����F�W��~�f����4{ ���qu*����3J��X��Y�S�o"�����g�B�n����ï�T�<�E����:��>u���s�ʗ')����w윓�b�(o�d @�,���8m��ݼZ����ﵐJw�ԏi���E�ۥ_��KF�������#laC֪ԫ��$�"lA�a�זG�q[�A=$��>96�c@��Zl��������"�&����m�=@�����؄6��萏���$a���k@�^>�G��N���7o��8a��X����ݟM-�\k��eD�����%�ۺ ldO5�`w�kK��A���n�@�ջ����48�)#�a+��ܵ������JBd�k��̃W�9�.�]�-�fPkU�<�j�[;�c k�-��\��c@.�K����~��;�Υ^�#�rg_:DR��iQ��C���>s��IĐ�|�V�����/￼�������������/���3�lP�g�n�%S���Q��L�L�"U��`�Q5hp��1���iy�v�R,7`:m(�Y>5Ge&)jww���ި�t�к�a @:-��n:��Y��T@�8�镮����ݭ N�$�I�����O.> &��}�7dTz@0 ��ʦ�s��p�V���J��aMRDF�oǲ�c�Xx�5��h��YAGd�$E�n�{���㟩�G�.��,rЈ�e�ng $K���G^B�(��� ��d�) `0�˓|�ZY�Нu��ﺞV�;�d;V��������r�b�^7ӳ2���#F��%�彔6i�l�U��'�j�!������ے1\�@!�S�M��nb�s|(�G�6��H�n��T��|e��W����/�N\�s�,���)� ՝W}�^C7�x��	�i'��[�H�y������,U�ຟ9#z 5�8�ە<�x�.��iL4�;��U�o.�fe���Rw� !)�}[���z��ux� �z���͹~�]1
�`���!�
�3T��i��f���=m��E��6�4��8���P��Ջh����T����g8˃���bw�M�/x|�Oe��N<S�f	��qu*H�_'��)�fK�ӝ��0%ǐ����)Ø�)g�}�4��%X��������W��?��4��u�Y��,Y�wj� �����3�����P�{�ۨ��Yx����c_���h00���N�����9�����r�g/��ԭ��Q��1����m`6�j�	��������Ϫ���%_4�3����,<{-H�ٞ�סy�q�	���/�!�;�؍Pn���tC��4�!�^����Y�S���a���4�����pl�9�`����'bH���&� A�n�W��6�b�1[-r�)����}��]Xx�ӧ��*���jG��h�g���z���Vr�z���`Ѽ+�C3@X6�M�#��w�l�.�� ��hE��n�1I
�*!�<u
��;ɐ�C�@�@Vo�@��<y'!a]��+�D��z�jJR��`�"��{
�5���~Q��cz�XN���h�K.���LZ^b�Q�w1hi��-_.U��՝un�n�qB�7�
!�\nꑇ�R�߻yS��VS�t3����.hQ	�C" H��q3t6�����)��`f��H]��;���eD{$��boI@�26�mR�[EqZ�j�}�m]Ğj�����`�kz!��НY5�F��� �6*C�2�Ve��
v��[>�]���0K�����aMR�Ct�0T��@�]�AΠ�i�b�z��n^���"�J�L�Lq"}�M��OW�
N�
�KB�݈&���2^	GhvGeaa�m�E���0�fM������L��k�A�U��{��^�RDb�����e��mӪI�y��p�N2���X��2�\�O���Djk��iw�%r���>+H�.
Dr�g��v.���Gdi��A��eU�۠��c���j�E�Ҩ�N˩8�A�J�ew��L��)?'yC 4�0[�M���V�����/�/�/��o{�m̢��~-~�J|w�q���Wgh�F��++�w����7�h����&�����>&W�(�M�t#s��:�Gy��#�7�0�݇f��~��݇C0`���tw�(ŢS��ϥ������+two}k�ݟ��Tw�,aа�%Tw�k��B��ˈ�8��jt[������9bw��e{��?Z�������}�T��c$w_p��¥��g��g2�wB2�`���*8�UAq�����/^'�{O��0�ⰽ��v?)O�h����~�>��=u�����ầ։xj�Ld�����n��.l������&�$��Si�F4��=��yZ��71H����v� ��YMj�iO�;�1��J�y�DFa��8J�K'�Z�8��=ˑ�~����R�U��U�R�잪J���1���^2H��_��z��[*��ۓ<}�k����9/bG"�ݱ*4~�Z����qv/�����k�^1qNqwd"��������0�lP�g�n�%S���Q��L�L�"U��`�Q5hp��1���iy�v�R,7`:m(�Y>5Ge&)jww���ި�t�к�a @:-��n:��Y��T@�8�镮����ݭ N{[Ӣ����Ĕ�ݾ��2*�  ��FeS��ҝ]���#�I�ۘtDV�Z @R2��k�ջ��,��y	�oݝu��ﺞ���o@�Xez����I d����>)o�M �!R:%^�#M�mD���~r.0����587�"�M ��x	aa6�: ���3�ױP���]��%����Gie�BR��7v�<� (@�Ћ����ItC�'?�]�>v�"�>q(�h �
��\g��1���տ4���N~ ,e�}�F(�[�(��ё	m�n��7g��O�zO�npT^�� �������g��fK��TX�'�ИQ�ѣ?t]�pa�4���|���k	���cΦ�e��H.�_k��g��)�9_w?g��y~.9*u/��n�y� r��=,{��Qi�w{�/��Ϧ����s��gS�<���@w�:�O��z�L\�t�����?�6o2�f��f�O4F�7�?��x�Q��/Q��m�d @�,A�i{|��/itxBk�t#58k~�{����za��fip��X7�k!���q����2��KE~�3F�����pߧ_2�\� �6+F�0��]溓b�d��Ku�8�ܐ��*U���R����Y
x�Z`��{WG�덓���s	���/�!�;���cX��Q8a���!�^����Y�S���9�l�1 ,����@�Yh��!@P����&�]����x!f�E.�LG��rk�*���$U�o���#�\�\7�=į�?���nB�FG2�����M��>&#I�4��'*w�z0��D��z�LIJ�5������ⱜ6�ϕш�\�������-?NC���B �z�!Ľa��i�z�L�ҩ�6k�f���d6�@H�x���ݙ�Ξ(#��#	o(oI ?5�mR��(N+QM���B\�*Lp\�!���̪Q5h0��׶ !�Q���r�������.!����d*w�5IA��=�lP��zavUo�3И�*v�D�k}?xAoTRf�d����nJ���Tp�Tp_�F4��u�y�J8B�;*��n�/�w��4kZ�OϧfZ�^�j�J�G�C��j�" ۥP��|,��l�VM2��V��w�I����z=��~:��~ R[c�N��,��^��YA�t�P ��`�>�ǵs���>"K���-���U�݈/��.V;-J�F%uZN-�� bT�.�cd�gN�9Ƀ2 ����l��ڀ ��_�����B  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dk8017vxkkbiv"
path="res://.godot/imported/Path_Arrows_Dot.svg-68f27e0f2dc59dcc2dbc6d7d9969e350.ctex"
metadata={
"vram_texture": false
}
 �@(GST2            ����                        �  RIFF�  WEBPVP8L�  /����m�F���ֹ��^ �����J4l���3Յ`�o���i\��G�I��6F�. ��F�擇gu�bķ�^�Uö����v)�m۶�I��{Q� uj�J)��=O����*2�A�Z��8��"o�zp^ǕΆ,9?C��m���휙`ܾ���ڻIڬmIjD�Y۶��m�&����3���\@��m���s�*����r�o ����,�DȒd۴�|���N\�	��}?�m�������A܍9?�]DD=���# *�1�;V����oA��ImƆxD$KbÂ�87�:D���J��H�Ʒ�-w��I��9&��]��o�4������@�:���N�^�V��~*������j$���0�G�M3t�Ls�>�1���DD�0����O��A �^�MW��(ǰ�F��:J#N���ݺt& ���S4�<��Z(���qA�tuu�0�/0M#Ϥ6kP*�v�kUUI��r?]H�aM���:B��]�54���i��~�y�������+�%%8膅����L��{����ms5��V�{�Z�����DDH�]8���4�Vjתh���=l���8�4"t�Y	 ��ÜӠ�[雊��Z��k�$�Sܪ @u��Ā�-V4��m6 Aө@7*  ����kW4���jF�v] �6% ��S
by�vE#|�N�r
��&�"��J,��Z�t��Ԅ ���M�E�Sby���F~��><�{�^^^$�M��f*������&�K�ܠpx��t�ŏ-VtA�:�a�)�!nOH//���{]���^�C�� "v�� $�\��}U���S�R bww2�@t&5|�s/5 N�1�R	��牢���V~�S���R��[��{}����>Ԁ�rI�@�'p��VQ�w�G\�8g ������bEI���@D�7�al�RQ"Wk�=̓�ID���o4S*Zm�6� @�$�;�x��W�̅N�`!2&�������>�#6���4UJZ���	Fr&@D'�߮(���#� ȓ3�#���2��AH���ȿ]j��QX�7q��^Qr��ɑ�H�t�[,=Ky�2*"�L�O�����!} W
��x�Kѓ<nB�%�e��P�n�1�P���W��UQ�wr�Dg�#}�{P��i��H~���c�vi���w�3gr��x�9n�4�v��,g2������D�����IDDo���'yv�1��F �q�oK����  �������-U����� ���Ru%�m �#�Gg��d��W��;���>���:�J�n�r%f��ҵ��D�� ��K׋��V�9�y�Z���'�K�Z�N+0�l����&`�Y/][9�F`��S�vs��""�uvJ�n� `�����k/��`� "���N�z�Îi~����~;�  �����~5� "�;�R��F.ߞD����͕������ ���w���ǩ�
���*U�<N�F���R��<!"2i  ��~[�~��u""�A�po�T��Ã &�c��VJ�j^XA0m`�1��[+U�y��c&�R�T���V�6�X
 ��Y�Viju��>�T��:��*M���h��)��:t�4-F.�& ?t�NiZ�\�a*ADD��ǥi5O�ED& ��G�i5O'��L'��ޫ��:�������Ƀ1��˼�Ҵ���M%T"2���Rt3r��F��cds��еRt3r��`T�J�⭖�gy�L* �y+��Y7 �	 ����4�A�}�c&��Ǽ�4�~��iF�uh��,G.�62ɰ�wh��,G.�O)T ��b�U�y��E�1�2�4� \�m��Wy���2� �ƣ�R���g L&DD�֣;�f1����3�� ���R�&�]L64�o��l��a�Z�D�H�~SZ~���2��c<�WZ�"�֛�2����:͔�V���8Ó `�'���J�l��xԆ��&�������"�m����q�s0�P�a�O�*��9O�AeB	-b�;i�t\�4�����L3�Mu�+s��|m�ɇh�G۵J�l;���E�*5��n��]*��ܥ95��e��q�G���_���Ae�!���CiX�j�L@����Ri�uԐW���hpԭRp��p��V&�bb]����V�5�ň�2�`��+�}�Z�Z�"�	�Wc&! K��h��[�B�������M;T�mh��.�B�Q��VKe�i�����.��ڛ�bT�D8�u����U�VLL�S�k��u�-j�׌���"B	G����H��F���*"�/�L9]�N_w���]��	"��ަ˃����X��nwq�}��h_���#�1Hs����Ź�A��:� "��T�L�Z��~�E�C?Eie�Χ�'0;Mg�[����!-�q����8Dd�l��Y3]�V����e5���CU7�����"�����Y�q>]!�*""�)Wh����Ͷ���<�����+:CU��h��F�Z;Qc�V�L�8�=�
�ܳ�4ZW�W?GM)�DD|O�� ?-�ik5Z��t5�;��:1�)��f+D�o�~�Ǩ�  "b��VU��W�޵�(-�56�nPLW��UZKD���v[QsZY�i��5�$�u�KD-6*߷5��e ����@D�6Ic�h�?5������DZ�D�	�/* �S4׈�[n��i��h@�W�t�""6��q4 �q��V�s��v�a�""�WU$)�@�߳nv>�z�A4(�U@�t����l�H�� D��Jw�i83�[i'�C|��*"����$E�r� D�ۓ�m8s-�ڛhp�N U�t���l�
oeb ":j�����]�ɕn�۞��Q4D&���""���$E��19�����X�/j�E����6�)"��U��r��* ���eC�?�ӫ6zы6zU��hغ��/"@UEL_X)" �r	�����޴��^�]�E��������u���Z�]C:w�i���>ѡ��l$��j�ҹ��W��ϙ.�@U__�s�Q��^��9����I����R��c��^�\����0]7����$�'����1����1���M���ҮT
� `�6��h�gL@_�0]9��а�`���a60_⚷髻; �G�kt�i����m�xJ- �kt�fF�i��� �3}}� �A��BfGA3�^à10]@�D$Dü��8&�A�cA  �L��������a��>� �1�HeJ��  ��k#���p����� DA]eb,�D�/�F���p4�;81<�A� ����H �@XVk'q�~�vv��gx���d�~�휤ua5K!�HP�(5"@�@wkl='��_��]�9��8������ɶ�5�eD�Ƙʔi" @�
 j�� �L�ŭ��A,� 6�ꊂ� �L�">8"�	u��au9"��� >� �L��ST�^��xW<�������O����ڙf��E��iv��b�E?�nv��Ž�*zV�#U�RE�jv��Y��Y͎T����{[��f�@  ��8bL��!cL�fbÂ#��ʼ�U�.""u�l��3�A�r���t�j���7������v4��"�cLN&�N�^�/�c��r��{��Ԉ��b �1`!����se���c6S'��A86d��J���˴V��H w�c"�hL'��,��hqJ���:�y��Y h���qi��-A]ܸ$�1&�ϗ5C#Ϥ6k.P*�v��$�F�<H�{X����|�~��e>===��:c+�����w�n��h�׽�SC"��rIɄ�0X]��܇���_��3�O34��^���u�+5���~�j/;mĤ��("B��JR�$�:�գ�4[�Pg���v�H��F��7+HR���Г�Ut�7Zm�A���Nq� I��n��LE�>�R[@�p�ЍJ �=���Zw+ѻ��a�uI���$	�/(��N�*���ֈ0� 	�ܤH�I,��f+�V:�	A����nR$��X�l���_h�F�l6�{$r�bi�VE�������f������"]b񰥊.�Հ��Mnv��=  9�b�C�*��7گAc������= @�+b�M�]��:5 <6����$=== 8��t�Z�����%A`�������霵�sok@ᭁɞ "==���6��|���ۯ��ƈ��Nn"��k5�fGy���I ��������\Ҫ�M`��<�(�Ok���͛DD �J�f�R1۫<�F �3	Ϭw�BE�\�4O�Z�����+�����>�#NDD2&0�uj��V�����%c2FDɿ[QR�HG�K0��x�{QQb����@�l��D��R��GZ�/�\�mT���<] �HA�E:�-���<�h �L�ϐ�WQzg��!�?���e/ �答���y� A�0�޵Rt#�	��?}#��5�nW���9�!; ��=,M+y�("��ϼvi��ǷgHC<��*M���hFr��?�U���bi� ��[)U�yauAn$"������yZ'"� �z�JU;��  G�G�\������q*J�a�~)"�#��t��a; �H<�씮�v�Jp6J�V{3��1H��ҵ��3S;k9<3�p�y�/�F�kWTP�����)`�Y�J6p�9�Wx��)_��a�8""���N��a�~)"2n  p�V�F.���!"��;��+Wi��[""��t�V����� � �1��r�'yZ%"2nc���[)WY�+��J�ҸQ*�J�xke*���0]W�At�k��܋\��	�j������� ����<e7O�O�1�^�m��܈\�k �����ϡk�(O�t��- ۼ�e(3���^ �v����y{e(ˑ���[�~��O��t���/�ޔ�1�2o��d1����3���h�G�r��<���FC����L�"_�D�1�q�"" �xt��d��y<��""�
 0ʓ^�V9ɣ��8`����QFr��<�b �2�T "�ELy'-��̶���G�ţ�Z�"��|�3TSW*5�ǽ=)Y�|�W��c���sKe!7;�1*�KEL��<:�z�B����?��C K���C��>.��|�=qPg*1�h@���<.�E�����Ҁ^:��X�m��>�!�0}6ӉL9]�N�e7;�R=� �3�0�A����e�E�߱�(M���N�Y��~(Ϙ�QS��Tu���L:Tu�|��i�2�k�DM)�Q5��	M�0TU�h��[(���Q�QSJ�JU�SU�%:�A�eK��s�I���>���
�xD�B�����6���ϒN#�Oi�$�u�KD��-��i��h@j�8��9M�HN�\#�n���f�ڏe�TE�Oj� I� '��ڍ��{�n40�����*B�>�	��RN��^���f��������i4D�ۛ�a�"�Ok��� �6&"���{���զĢկ��n{FC�.���1�0U��5I��K�|��z�n���>��=��l����a�Ħ8HJ%���3�D��l�x��===��;�4R�T
汉�܂Gu<�@==C���MҮT
� `�6�DN��m=�E ��o�cD��	 F8�]�Ӝo�ր1"����4A$" �ZŅ�f��z�0qTF�3f���T*@@����d�������|��'R塩TD"���ȷ��	x���d�~�휤ua5K!�c*�=8�
P#" t����s2��;إq��~I� 5�W��Tĭ��A,h�f�H�P�RiЕ5A�b�Q�RA�3�rq�)Ȇq�}�I��i�X�4�����R}4����z\����߿Ͻ뙆�i��g5;R�U��f���H�*zV�#U��劉�v�jw������Vfo�7�ಘSHm�'~���A46*s��u��:D6d�ޠc9K�珺�G���< h�^�/�#��Kd!"	 Z�O�m��%3 �"�:]��t��~��̙H ��x��.��C�A��|��tI��ә3g ����Kk�PU�:�K����|h^��w�P���̧���_TG�9s�\�Ґ?wP����1o�VW�7��'c���=�~�6W��P(� 'T9���A�Z]"s@Uu��}+}S�%3S	 �s�&����.�yBDH ئK���]�e4K��	<� ��t���i������X>��*��PyB,o�uE�� �"[+�[i��|����%?�X�e6;�T�7�������M@�sb�M_W��IWWW�ө�K���]W�E�t���AD���˘n���Y�;א����� @Dk���bE���V*��P���l�,�EL{'�W��5l%��ey��שU~ ǐ���A��[�(����.Ë��۬(�"���-���r�*��� �6o�</��x���z��r�+�� ��ޣr����y�����*��$�eE����z+�x ������DDt��]9 �mo�\��:+����yW���u���f��9/��T1����?��������:E�K��T4�!�Џ��L�}������%R#*"ҏH�(�0R;S2���d/��a0{�����(;�� �#R��A�i���?~Rۛ�y�ad?*��󧺏� ���P���L眛7���s{V��1fތ1��1��?���������?���������?�����BQ�R��2Ca�B!�\j�cQf!|�L�]���7��+R�""��HmO�ֹ����~�=���أ6��� @ٙf��q���~rko�ٛ��A5��o!�e.�k��tι��1�X�7����������?���������?������0.��̥v=e��~GDDez�T����o�=�[�[u�~�㿃 eg���������?����������?����������?����������?����������?����������?����������?����������?����������?����������?����������?����������?���X�K[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d2c088e42ix17"
path="res://.godot/imported/Path_Conveyor.svg-c38bc0143497f1d1817d09f71b4db01f.ctex"
metadata={
"vram_texture": false
}
 U�T
PGST2   �   (     ����               � (       (�  RIFF �  WEBPVP8L�  /��I͠m�6HW1������O@e��K��BgS��FA�6���Ƨ�`ٶ�'����ÑH��I� ��md�(c�ˣ�j�6`�2%�8�˱X A�	�
HMD�݁�  ;���3�G�Aжm���I "b �ɶa�Vj~^ϛ|K��ڶm[�YJ��y�bz�����zk�B)��2j-���K֣oI�,I�lY��#2�m��;�33\�}K�dI�d[�"��=���;FVf����ڶeY�_�&#;NJ�\�����9(��@��i
T�#ƥKq�m$��N�s������M�$I�^Q5r���̌��j�^f>�=�=�ݏ�yx�`��0)��HUD�������~{�d[�%I�p�s3Ka����h�������|K�dI�d[H��Y�=���3��KUe��؂�q��	j����r�\��R<u�+�Y
��=[F�_Uj��:e�&��3���-h*w���E��$iz�(4M�tٶ�J�$�}�}"�f��с�򏙳��UE��s�O�U�HlI�$�z���ݻ���F�$I�e��_�۩�`�HR�^o`�}�m�I�m���̬j:�c��1�l޻�(3"�D�yj��1��$ɒ$ɶ�E<r����x�tW�
��$ɒ$ɶ�D={���S�ڻ��D���H��pZ�� nIR`�ܽ�?O�3-����m�@�����3l�6����0ڶ������Bu�o  p���?�l�Ps C��l���n  \���������3 �c5��@��Ӈ�ߗ���aZ��Z��x��y����
v��>�>/�(�����. ��L��<�M�xۿ��ٝ/���0N=���s�?Og��e��,��F��r�?B�������q�P�6�������O%���<6Ƭ��F&�~�/R��-� �zi�'Fg2��1 �D`W֌�]� ��\MI��٧<��L P�
^��ɷ�g=�nP�PPx7�Ι��%z����Q��}�4 o�3~���Ũ�=5���o g.�?�Gt�g��Y��v��xd��s�L��sf����ä���t^�=��'o��^���  ���?*��?k�S��@��.��Ls|~�_�݋Q���>�8�'  {f�ҳV]}�{u��x΀�������2�O��nþ
�70�ӿ��*����G��  |��3zN=p_����u?�/����X�?����͉  r  ~ �m�Fn8�B����Y`S�P��ei(7��Փn��"{g��3Wx��3�i�  ���G�����u��PmZ�(m�3sx|���#0�>���?�|�D)� �2��Ed�08�>ԡ ��8�`�PS4���S����_O�B�G4ԍM;�>��>w RPnU���9.Q���x�=�~����+��q�q��:�6p>�3��:U�:�~ȯ����8�}��|lD�� � @���Nxר ��'r�PO�D?p�#2����^�(��g�Ѧg�����k�-4�=�7^; �r=��(�.x����  ������  �z߸�z�o9mj{Ϋ�6ŉ��7����=AN�859嬸`hqV ��uJp�z�3��a�  ����7j yb��c��@��p4~ُ�ٸq,�f�e���o�Z`r�z��_p�� �R_���,�K{T?/���i_'[q"��Fɇ  ��,]��]��t t��(=ڡҟ t��3Y 8��5:��v��s�6]�dr�9�˺{E� ���D  ��y���e���f~����1>g|*^���ç��9r�M�*���� 8+
�C|^� `�Ņ��	 p��� 8 ������-��<�  \=�e�Y�ۑA��f���\���`����  ��x]�.�SS���?����9/��vN�*s��9�)� ���� pV\t�@�v` -�:�;�o��b� �
>�N��>h����0�P6V�p��ݗ�q����ܚ�：�ֵ?��k�a~9�?�q��:������X���o��7 ��>@9@(;Aw�L���;d��,b
��L�� ��sx ��፪���r��| @9.nd���)�v��Үu~(l�rw���C` �~|�w]�`r^���|�}� ��#w������������X��	-
@� � g��w  0ddE#��KsbY�6 X�T=>�|�  � xx�-�@�s�h'ڗ���e��z?��ǹ��A;���!'���� ��?>�x����^�S
�5Ή'��(��0  
@��D�KX��x8+=t��Nt>BQ��xh��eY:K�A�f���9��0Ga���+��x����r��  ���k�����7��xO���x<�;U^��#s�O���5���� ��P  hq��E�=8 '�g�-=���.e6Cu!c���9��������-f��  �F���_���Z�.ω���rm���_s���i����6���,�E���.o	����ԔC.6 P�]OB�:�- ��4�LD �,;ɳ��u��v�Ö�r���ìsݞM�A��K���u@�  ��s�����>!����b>�T���1â-tYtY4BX�,��"㔀�aء�Yn\�L����>7�Q  �y����mt�<|�]��{��B��}f ��z�v؜�|x�v�v��������+ �r~��i�S~�����lD��%�� Z� @\� `Ozd��)�,vܕ��H������3j�<d�"	 $` ˡ�,f�C7��/9�{q��N:ҽ&��a7�U�>S�I��^����X��?_~����]z<̳�W}�߃��_��8�_C�U�FW�(@f,B�EA Q@��+Yb����ʆ�[������2q�A0�n�9<+?��r���a{�Ề��\,�u��n4CwܛS^K=0���#�z~;��r'���_�y���y��6�K�C/r��Ҳ�D�
`C� 
 
 �.u� ����nt%�;9�9T:z�# ���P����2b9����Q��?��% 4�y��/9����oF�e-�彬�?F�5 qs��������䉅T�g���}�_�~N����~����EP�N	<#6�,��r����"�)an ��óx�C��<��1��x>��z�{w��z��[Ӈ�h?��>���N�:N^��k�lӞ|�E��Z�G����)��Q�CE��ЈbQ�  ���V!n��   ��p �x1�#R׀Qr����}��r����Z�dŭ4  ��N|׎�:� ��e��rN{��c���6�$ԓ��TN  �	 g=�|r @6 ��[�p �C�����3~/K�������d/OL+Ȋ�L�]o������w|Zf�)=}��y�������s��l_���7��9G=rʧ��|�����8��(J��0�{rU'z"Y�LD�r#Z��d�!
� 0��ZX�_	�
 �3�xx�  Xq�dĀ\��}�=�^IK3���r����U�  ���gط��T;Zj;��<#�G?��>�<�<p� 6���y�`��R�E]zA&�aE�P�~�L*N �=,$�$P6�P  `�Ë#'���eh׀�&�u��m�{ȯ^3��

H}���b���L� x�ک;=��3�y��Uz=��?U�SZp��P><���O O� �EN	 (q&��(�0�HD\FeH 0�0�9���F!�/ �k�f��2W���1��ݬ�x�$�?����P���e��ۧ�K��[��}\�{�W��Ǐ���T��D �
  �]��	9Z��,�Z2 ���6�d��hy���Ι(9�ᩧ�Y?�3�si�(�K��I]Gg�r�#�5�������j��eΧ������_ pJ*֊�����쿼������-N����S�@��, Æ'@�� G8x��= z/��Q_zǫʈfr�r�6h�\  ��H����]<�5i(t�v�;9�;�uw�F_������}��䏤��ןw7���{z�V�|�����?�r%�/���z����|������-^#BN	�K;�Y��  �  ��qX��z@όO�S��� ٠ �d���2��d��V[���]�{<��m��/���m�s�`�_ >��N��������_���o�ϸ������u�r�O�q|UIԥL p����7.� ϭ~��@ <��?�>`p{�T���u*�7���pҲ*W���^���ړ�̧��������/?xV�7 ��3O��Q[������pj���թ2'�  �An��󐄈�glB���C|W�g�����H��ɹ���Y�o�ۿݓ���^���ۿ-���*vic�qx�e��|���L�ǘ������Ӛ�L `XI,{�8�0f���0e ���h�e�P��Ue��  3��jGd�`9UeF�G1�G,�,��p7H257���rz^ߝo�?n�nO�/�6����/���Z���yϒ���Ջ1yjJ=��.��4ؖ�x	/���C��ih (�5Ŗ����vtw+co$�L�E�U?k���Os���|�v��\����{��8����y������S<�<��[��  >���xb��=�'5��U�=�E��{#���r˓�ؒsU�񹞞�|{���t�x;���a���~`<�
\} P�纭نo&��K�����F���a��8�]� )&�����8�avH6%��4x�g���;���
'�'�2��x�=u�o����<~�t�����\����������rt9c�K����P�"��>��ϯ xzt�Ճ�Kή��= U ��F��bΙ.+�f�� ^�. L�C۪�"�SϾ� ��s����3�_W�C����{������G�9�O��;�~yٮpL��ˁ���x5���z�ᆄ�-���%�u!�{@���X}��f��n��a����Bw���!�zҷ�������ȯX}�������(&�~�g�/�ڜ@5A��,��r�̟S�vhsSS3�x  &��>q  ���9����8��Ɠ�r��9Z��������l�Ip�Co/'6%Q�Y�-u=�$� _���xbW��I�W�O������q���''��|�@r   l�?M�//t�|��o ����@�|ꇯ��<\ܵZ � 0�ݓ��L6�2�I]���M�t��0�2�����ص���b�x)���[Sw�m� �T��sb�6٥�ّ�p�'�q~����{i:���k�6����~����_V?탿  ��24�.������ �Ī�M
��+e6��ز�}-;F��������6���s`?O�����������^�8��|�(�QV�����Vg)��а@L*�|�E�� ���_5��}H�F�� �·p�C�ު�n�(w�ʟ��ؼ*{�^��y0�X�i\ ��#�҅�8O�9nͼ�1f����,�о9�	 ρ���` ��9�B.�m�|���ؗ�w�[��]P����m����0�?�?^-��y�;BH((C'Re��0��ϋ ��� x"�O,c���K��8z䀻��fL���_<��4G�!E����+��v�T�2SU =��� L�r n��j�x�9h�ì,~� I�` ~��ߤ���η����E��ќ� /��L�����9�N�/ndC3�3�);�����'t� �;�꙯�݀������!���mw]��m��>���ћ�`@?���\��=P> i���WM����8�%�|��@�dv����dh"[� ��}���|x�m�Jz���>Ċ���T��=�g?�(8(PY[<�JI����՗eY����H;�U� �9������[]`((�,��>�����'}�A-(j�l�n S�qf7Wc˺� L!�0�� �l�d��TC�C�",�x��3c?���o_��J��(D^��t��0�� h���:�Z�D�Y��Ei"�H60�b�4�4�����%el�h&<�f<c �$�Π�)��i����8�X��a��Ft%$�a�0�w�E�;����X��X%�X e�`����O	 ti��/��W{�b��q[������b7�,5��"$ۼf�T�"S	�E[D<!;�r�í�s(rUnQ����|s׿�7��[u�'T��L�(|$�	��|����Sy\Hi3� r��f�b�vc��h� m��ڶQg��JS�lxD�!mr�=oo,�{y��U�%���k�(�O�<��ڟ���GO��3���<#�2`)���. h �ٳ_���W<p�ͽ��IAS��*'�V呦1&v�$�8�$�e缽����s���ޛ�;��{��_��� t* �8'Ƣ>��`nD4! H 	  J0 .�Y��v���3^�6`���zR�I� Flȳ oUs�(b(B�«�c����g�/U��0#�1 � � �W�d� ��⍹�ʳ���l�G��n��=/7� �	`��J x����,-�����:�:j)p�w�Nvw7��!��7y= 17c��(`�I����js�"�1؛�1F	b@�`�K�1�K���e.=X.��_�0]�K�*�Z�/>#��'b��e]�d�4>Ȃ.�,����ĝ����5n�*c���J�0�vm�Z bR��7
��r��A�(8[] �24QQ�����L�TZ�Y4ȑ�O�Z2MDXp��B�e�;&k�z�͕��U`@@�]��mg@�f<����$b���	�f�:h��"W��(�W��m�J�Nl�C�剡�3td��Ʋ-��( 0��((�����/}�J���@Ȫe3S��h�\�xeMb�(Bb����2�\c����%<U�"�����!Qܑ��IF�$�ʒ-���72�!�yҊf�������0�_�y�Ck鑳pH��	+ k1�>���'<eO�
sCG����I�B�M��6��F�Txl�8�qd(�(q�bV��&8���-��/c�Dnu�&��gi˪����%� >qB�|؃�`��s����� ��L`�xJ�*��@(���c h��m�y �pX�����a���%k `�]�<��Rd��üG�.BM� ` �i�G�.'� � ����bƹ��oK�yr/�`Z�c KL"�)���5�͊�Ƿ ؎��x��- !�A����������� ��`<�L��*�wq�.�&V9M�:ъ�ss��/��V����Kt ߽���R��N(}�� �l���)3s� 4ٌ` "��S�f �]�i�,5,el�^H�"� !�'bx ����ji��f�,�XѡP�d��Cb�9�.�Y�CK0n��V�?����<K�d�#�0	 ���yI��=�D, p�]��8�ޔ�<��{i��H���IA۔�1��6��S~�d��ۑ��( �7��%TRʈ����c|�-�@?���C��g �1�(@=N\�v7�˹q�[<����7�<�ĭ�!%6��*�f@3O����2+�7�Bi�pQ"�J>��w&\�v�����|)au(� Nd�A� zt�K�.��{�@����'��㥨�j�5j���26��UU�N����R����j(��(] u�5�K\�y��r��� �/n��5�mb=Մ�J���T7�pp��x�z�˻0��^7	 ��H�f�Ci^Ueҭ?���\t$���Lˁ�UeG.T��*h6�kRe&�x�uRS�Be�Q�B=d��(�RJ��=N+
pI}��@>@ /v��M��@�P�����c�/ ��w@��*��] >h��|�o���&��
SV���
@a۸C��ʄ�
���p� ���"2hhY p��<���a��b�t�J(4 -��r ���p��ԉK����M�ܦ��͞M�YmE����I 6(� p�9��,e�h[�$� a �@!j`�Q��{��۷_��+�yj%��p�(ϒ;��G`gz�.=����⃊2SS���h�ޅ36i1 Q�e��e�ɃتBes5T2у � NX! � �U�����}ڇo���e����X�(]�5_�^�oq�rl4��{�,��S�n��/� {�Oׄ��n �Ue
�j�dղ;�D�A��蘔� h_/(�b�`�B����=�1����!����n|^�ȱo!(�@N�1�]يZ��X"ԥL8b.����(�h��	h	v�)r��h�^�1n m�C�@�V����ܣO٭�ys3j��s� ��ËM��Ӿ��Q�`l HsM�@�癵�54��p���O5��Wo���<��A8�7��j<(��V;�+%"(W�.�P��ww�B��l�W倐����>��m-�^�7b���x�@1��m��R3qDi�Ah=t���lxJ@)YN�,�08�P�,����z=d��R}��x�I P���G�>�<�U[Q5�H�H����-FQS[���y�96�l( zC7�S�R)	�C��A�p�5FIqv�7��}�fpi�=2�X�� �@\ 5kt�1 B{3��. (�\��i��lm�q�U�����.vCp �x
[�D[֑ց�3�y�Ū1�mQ<Xu�@�	�F�	uk����z��p��8�<U�\j�!��nh�Y�~J�ſg2	 �A74x�	%�D8=0"#��=��[�٫3]�e��U�(�)g���H(FA�z/[ ҳ�A�ت��ڀ�
"!h��b��f��̤Θ�،�c��B�`!��	�&h'ꍀ���!a���+v�g�ÄZY���R0��i r@?�����. =�q�M{�B������t+F�	u�D3S1Q  ���ږ��j�"�2�)@�$�L߃�Q��i1H`��`��LuQ�T�&����B.�ز�PP��!�<� ��P1� ���=�����6�l�݉��ڴ�b"+R{ D�g�x�Զ�D1eB�D��67�=�0`��mJUM��JU�rd�/��0�0��"��G���bA�\��(c�1��s�r*��	�x��@<����^�lc�7�Д�

S�խ�*Fs�}�nz��I7 ���_j���0���2\[���>c>>���~)9#�<=~���ii#��C_:�@;�_�z���%s�������3b�E�:�uk��8�sꪫ1 	ZLhG�C?�P �pq ��8�❒1�vqy&��6���~��2"�髒 < @� ��Q<�I��y��Q�Ԭ��Yc<��M�!�`�ޤ��*�l��	��p���|P�ьH��&��0.a���}�8ڈ���v  d�Rh:�R.�I��u���*޼�;��V�oe8� ��ɘ3�T��6�
( ��0`�Ҕ'��t2}
0`���3�$1�h Mj9cP�zC腉RT�A�7�Ee��r���q	  ��}�, �%lxN a�F�����%�����`u�5�]��: �c'�*�l���3� �1b*%Lͤ:�,�mZ�"���0���@b�|����U� �SD���R�(e�
�U���vb����S	ES1�J�����CF��Z�
eȁp�t�+��G@�E���q*�SL��l�rG
a|V�#Pf�# t�J��H���"��U�dm�,0|�1����I*1A �x<�2���!@��	 I�}���8u��c]$��np"wyO=d��O���fn|�����D8gg�(d  d�[XL���K���rW�|q�'c��z5�νL���V�9�[L�f��{tV/z�� 0�.XӪrL}��L�Z�l If��0�`*5E�&iOa bD�P6*E�@L�9!v"� PQ�Tk̡T� n�|�x�gií,����J�o��(��� h)�d�$2 蒫{��3TV/ ��kTى5��!�N�8��G��M���t>�@{%�p:�q.�#�`����Er��l�9�t��@^����hN���`�bS<��v����hhNyq�'h��(�	0<+�n ��|����P�<CF>��]]8�w�p��?OVN�
���U�^���=z?<�בe��_G��Zf��m��\��xH[-}Eđ��b`��`6��l^\w�&Q<50h>IH >&�G��g �;�Q<�@�b9@Co� �"�(��OpQη�E�:�[��N�����'jY����,;����,�.S�5�mN�=��{���>�׋9xC���s?/u���.����4�vE�S7�c ��&�-?�<���Y�k��N���b��� ˖sa�H�!10�|�ʙ�@�c^�:�,�-�-�w�\��t#��(��ʄ�Zbs��8���6��$��\��tC��w��`�2�����4�%�*w�����{��ݽ�����9�]8q�]G����=��{;�g��=����S��>���7�ݺ F�z���lP��t�9����F,H���y�Ռ$#5��b�-+gּ���t�uwt�Pb[�9����G��͞�Zi4j���B�A�@앦�� n(  ��yZB-�C �
'@I�e�}˫w���?�=?�"��c-sd��g����H;o����#��O�>��yّ�mkQB>@X�sw���L�s�%����H����̆�Ԭ��ԀP &�X9�G�8����,�����ة@Lkjv�=q�K�ם�h���,O+�GKd	EGLwp*n$����� ��"��2��f�
8 & !�����g�s�&������d�\j�#��W�O�~5�~��P�O������|�����v�Zh&���Xe�zLJ�u Q�
E��)�9�HRd�E�l<��7<�m�ᏼ����"w�����}�D��s�|�Wާ|��žq����+ԫ���V&� �@��!Un�AP ��z&�~����ǂH� ��D���)(���ګw�U�ο�����	ѻ�>vW���?����=�ߒ��
;r�>�������o���'���||�][��[%I7�F��'�^Ƙ��^/����H���F�	�8K�ы�@±eyZά�����f���o���'�6!Ŧ�#w||w���O��W������~V������D�L9Ah>��c����`\������[�B6 �p}#�!(hh�*ы�s�ܿw����;���w��x���<V^/�������]#��ۅ����v�'������O|?9�/��m�8x}.i�e'�
��%�G�r��cN�8RdjN\ii��l��$� @ɺ�H������o���}�{���u����w?�Ϗ�;};��Y���������_��|�}�����X��O����h���D42���%�������ߟ���]�9�%�p(A�$�R �v����{X���Nhd���w�^�����]�2�Z���w|��{{�[����~v��������{_>ge�z��pi�rj��/��9�Ņ3g.�٨l��"U6j�����e���]�������o�������}��m�}��/�|'�.��{x�����;���}���O�~�_������g�c��s��%���	��@���W]�e�9=h�%b�FO������J���C6��?�o���#wNq��N��~�����������_�LMV;��}�+������8�߯��=���~��ߞ��_��{���q��dK�a��9]gV7��drI�cڈ��OY����S�vx���|����o�q�gi���iN1���o}N�����.Nsr���Fۗ|�_�W��{��}��c���J� ���Y�-^}
�W����x�j?����<���ڇ����d�M9�YY4��1�5�j;��C��|��gn<F�ut���;�5�,�|Ս
 G�����N��_f~j����?�?߶
�{Nl7_ߞ�zI�����C{]�W�mfu�w���4�ꊚ��!���B���%K�5�h��yxoM;�ͣk��d������ߠC���Ёo�p|�O���մv��AK��ֽ����ot>�\�QX͛�Pb4Fp�Eg���HtV�Eb0 Ҭ���='m��71�</�|4�����?���2�]�TE t3��6�pZ�d>sH����{�9�tN.Lu��%��-�A�@��=7�3�BB5.����]��k�����q�>݋l�n�P�;�+��]��zI�z�C�Z��Ҵ9(3�,]<�s4�'���^���m�j�k�<3u��w�����r}��c�����t���t��K}�}BSZψ|������t�/�w͚%֌���hCY�H$ˋd����Yr1�/���r��[�y��s5�<�6�C6�@�<���^ 4@
+l����>��jl�Z�t��s���e-�Jy��Z�����r�kP'����m��w��oS�O�3�x����=�W�	m��&2F��i"����)90(  B���q\䐇��y<�
���u�m�w����R�zW�@�M�;�Ǟ
����7&1d�]�o�����52�&	:�5J?K�
��(�AY�($AC��I����xƈ-��ΊM9W�G.9HF�+;�.?Q,PYul �k����v�-��i��#a�������pӈX�s!��mҙsL����������J�o�%��P6��6��o�yu�-'�������	�aa�Ok+`n�]1�ti�r �h�͇.���y����|f#soi������f7F�E���H"!�ƻ>��TM�x����uK4��2yX�h�%��,A�]������B�l�Ѕ��S��e����ix{�]���Mc1��O���e�K���I�������}�_�9E��%�	-���8��6�SE����w����~�|?��ߏ���=`Nzvs�UY����szǹ=�s毺�T(M�ݑ
�q?�5�k����ћ�t��<������׻��s����=G�ͫm�-ض>u�P�����^����Q7W�Ȑ�]�[���Ji�K8P�֋#<��b�,�D(���^~ֳh�K&h�B�4(�-(�t2@��)�&Gº
�S�nv��^i�V���V^  �@ m �Ca��7 �����z�<z�ÿ���?�1�^|~��Z�DK�^V�S3��R��{H ��8�T���%*��q]�\1��5��A0����t1�*e~a��	3�8�������=�fbD�Rk��D"�`d�5��$&X`H���Y)����py�o� \hA�$�2���g�2�$T�d�H�́��|o��򞷶�g�7S��I>�4JZ�'\�|��΋���v�O��G�N����.�\��~)�����`~U`K:�b*<Z��B8�J��J�������Ce����ߡ���G�~�C��~�n �mx�ݠ��������~��NP��v]O�n��B�$#	�2C��p�ry�ņx=k�?�, @�/ �0K7y�1,�L��7k=�>��}����}��36���oN�qp�C АE����׹�kOm_k[o[�K�;�3���R�gF]O�����y��.���:i�ڶa 4X5�86)��[ǟ����� V�nm���'�����w��q�`ֱ|��}�Mם�\���t�Vb���Hꄋ���.���� ь��@�,C�Ϣ^�w��9֛�#~��Ct���m�<���C�x�k���2������kw��X��[	xl�����=; !�)���~8l)0S��ߍc��c�t�픫f^�^;����|�J��nf�%�J�z�^�XJ>k�s;7���{ZC���_����g�������=����W�{䨿�Z�.��1Hr��,�,��0G�3������I��9чw��q�&t�$�EZ|@�fFu���g��IU��J��z�!i��[�� K�f f�eY��3&V��(�}nS7��j�ƭܣ.eX���Ҏ��ߨ@��{)/�n`0�����2'��A����	� �C��e�y �#z��rC�sJ�m��y^(*ߥk���zY���S�v����F\_� �|���@��g ��w 9��=d{�:l����}S�ڿ��F��e��
O�"� ���`` 0�x^�>G�	�h>4^���Ϡ^��v�\Y4x1aKLu3�iZ�]��Z���D��M�6��A>*��u�m�=�Gs �'�g7fL�7�璶��\���E�<������� �w�'��_-c0�j�6šw�ı��~�ܿ��+�u` =h �l��{�����0�<X\��֝ہW^��[�W|�̲�������$�%g y/i�)9y�qyH~H8#x.�%)/���\^�Qg��A{}�ut�[��4��'��~����ߊ�����������/�)�`�  >uw�[&�o4���ቁ�!-��2��X� V%�-���5���[G2c&��=8I�u�[�H��yƿ�����w�܇�-I����}>�����,ݸ��J��_6z p(���"�Kte�$����l��$�GȅR$Q�nR�T�*r3 j*+���l�$!�.�3�0���M��ޟ��7w��;Ԣ�Gg��Y����MK,��w1��}9�V�H�#��Wᾱ�C���Ⲵu��^s
E�J�S�bkwN��ƙg�d�cI�q���e��n�#�����۪l��s|����6����i�e��wi�B^&X�Y4d�Gݭ������νg� ��P)P�.-}�K��<]�8�� 8 ?�`#��[ҁ�*��,X8�7�r�'�Ks�]�e��Zpܑ�4�7z���K�!�c�}>/_<����ԫ���+��-�?��ۖ�3Ne�]{���[�'�-�$���^=9	��=�p�cMÌ�ɚC�Ҍ��Xfq�%;������M
]^6CwP�f,��'����s�r^�����>i��M�v��z�$��"�BI](�  ��  �P����g����@�X�����<|ڋ����h�z�82J2j��s�H�K�������Hclӣ����0�����QOs%{��Z�{, ����>�#��[� Rf�7&��PĆ� ����Z�cj٩Z�İ֒�ԯ8���;$:-�%�ql�>��y����Hc���7�@ͪ�7�y�_L!�G{��˛�l�r�H,I���d�VZ�g<�ǥ�Y8��O�9<A!`9&o�<��D����5��P?�ϱ�Ӷ�����z���}������o\���������N����l��/�r�z�`#06���)6<>�@�h8҂2��S��	�[�ә`�@:���%����d/��;�fM�2������JK=�M������-�8NL7Qˬ�G@���� �T�*@H   (XC�	³fl�Q��R���xX[�Cޗ�0$�{�Dr���h�gI�#/^�Y[�q!s쾹��=�������s�gڤ��{�w^~=ڧg�?������8'3��>�9��qx�*7��ϭ�d7_a��s0C�'��E��W{<K�'�nzBy�|Lw�>�T�D�O|ni���J���w���.�p�y������Æ��-#��&˕�}�
��ݳ�3����G�������������d�&'Vr�12�x�h�]\f96M�j����gM����k��[899w�3h���ơ���3�]��nq)~�S�#�͝g���Gn z���jV�k�=1���.煣}�&�.~�-�� � ���4��=��#�4tr��	�|t<!����wQ���it��[��R�3�/ pk�~d������鞣�i>�^�Q��G�;��yBѻ���04�ӣ���Y����0&ԅ  ���%X|`�ލ��]b�I��{8|�^�$�
'  P���V���!z	7�	�w�N�>ۢ4��9��w}�P�}�|(|C���"|F��7rj�E4���<Q6�!� e�ukf'�L���J5��2�S�om U�+&+�#�ϕ����g��
��5d����p��{�?�Z�M��8+7�BUp���U�,7� ,�B���� /�����ah�b!���6nh���{��a�O��aU  �����G]��&��|N�Ռ}&}�ݡ���v�,;7� pG�<n��  �Y�g<�H�h�;M�(t"�h�(��.�Z5�ӓ��y���8��i��C�z<҅�v˼�m��rp��+�|��&|y��[��8�x�l�WP�YT '��#5� *�Pɉ7/X�����} �nܪ�,�fQ_H��^�3�W�CÐx�s���m��)`��[X@�ݨGN��Q �F(N���ϯ�t����y�ů};��f��V-��^`:��^�ZE�Ӽ��dn�����J%��ր鳎��?ѿ�Vf��3T�@����؊�4tps�w�z6oSw���>�d�ژ?�ѧ8��o�I�r?��gp�u���Y��%%@��p�X��OR�I��X�E��	��~  `Ś" _ 
��
�;����h��	�!������<�g٤3�o�<dhi��s4�.���k���E;C�1�V3�8��J&z�&�z>�HHU�߆8@�,K\�t�梞o���/|g��=ತ@�����e�{Y�����3�n�C>���c�}���=��=�AA�6 �����P����2�ͳ�� l~�/`+���8h`pA�.)R茶�	 
`0��D�>/4 -�	����!��������-��tR��n��CC�%9��a���^8��-4��Zpȸ��D(�}�FDB�����.�_rp�x���Yz�<�����˓�4����)��K"������Or��waZ
���  "��%h��	 �6�x�=t��y�_N���[�uy��p �xOh�"	�� pю65�w��yTw9<�k}��i��N�b{��Y�"Z�]��M,�K�� :���0�C�Y0,�����C/�.��;��~����8�1���}��_�9�G=��;n�`�v���yޱ+H�Z���'�I�i�r��y��8˓7�Z~⃇��-)8 p�7� ]6��H���&4��8?�x��Ǜ�+^��5J��j6m���!�,C�-�-����8�L��V�q��x�?^�������m��-w������{�f��_���y�?��U����S��+����?Ǚ��#�))�͟����]�_ۓ2�	���^��=Rz�	=ok"��FL͵8�0����%KY3�^��)OdO�(D�&����3S�G��HW�r,�{K�wdin�gW�ϸ�F�o�b����������\&�Z�^y��]���zuq��Q�ެ_^"4�F�&(l��Q��79�5o����M#d��y�o�_�����������L��}mnu-l9ؖ�~?�A�.Q�֣j V�W�#�in��i�[�z���/��9LՂ�{ic^�Ԋ��ND"6m
B.��a�m��2t��_�����\0�ɭ��h���}W�����p�����h^�����o�E�4>Aq/�Ae�%"V�"�!�=���� .����'n�D$ܫDy�A.�G~�Q%���8���O2[��[h��gΜ��-�U��,���s�x���^5J������Z��J���~�|�.��wc���KQ�}����>WJjj��^fj!Zl0�`��6W:؁ytL�HP^�\�6��?���	�}�)�1��b3_k��}�s8�ݕ�Io��:�AE-���""2t��94�.Έ.6`@[/ޫ"� a؉7�b�L7��T�$o3��	�rI�.�"���u�d��YI�,��*:˧�f�SԳ����.W�X�ݝ��i������Mw��tg�x����{>b�=�e/9�[D�(�cY+���4�٥�Z�
�m
ê}�;>����Y�����3�o|�}�G*Qg�S�3���Wn��}����10V�s�\n�Ph�DBJܲ���;�;�>������Ca���&>��E�lB߇Xᾦ2��Q��qSvʻ�<Au}64��8K���cߞ����<��3�i�,�~�#߂�T���]cS��e��8�����9�y���߷�;�3�'��u��|e3C7i�}Vni���Q��7I�c�]�����6�'�4��x�>���L|���~dw�򃛣����V�T	�/���7��_
~����|��������F��b(����%ڮ��Q�$�\�UF᲌eG�w��pa�� �`�����
6����kf�P������pG���_��R%��a��GL��m����19�b?�?���LM���vmHTݷ?.��<Ε��ǘ� Bk������v=���P�$e	 ��s��K�}��O�� x��P��3~.5�[^;�_�r!�����W�s���_ͧ���X�����a3�IR�B	u%1� %L�]H2�`@�k����� ^.��၊'�����.�s�Wh���$�76�1s읱���a� >y$Ss&���O�E���K��!�O{����ӱ}r�g��|���p�w�k�3k�2\� �"{-���Ԟ�9/�4�8� K���_����ݮ5*S�;[�N��g��G2�� O,��l��D������u�'Gӧ#9v�����c�8�-)	I,��� �,\*��Xy������_;�D�_ ;�2���� =h��Ⱦ�=
DkRU��ҽ��:�>5ݬ4qWĻ��Q7YϿ���e���I����@ۛ����[�tt���71�e�	;ֺO���{ꅼ���Э�o���U]u���'��  @1C剜�ҹq��b�;��Y���np����C���Ü�1Ԡ(���?���_=c��}��b��-���#F�Ċ�2�eD
�W#�Z��	u�>�y8��D�'v�y�8QS���F�7�P�)�V��F����:���!�y<QK��'��Ksҏ������<i~��{��R��n?f�閹���}:�|����;�Ŗ�6�����C��|�݃��+�t;�ql�a{Ua�5Bz���m�b�.;ψ��I7����)���}NFh��H��9��`�|4���a�ѵ�b?Q����y���v��������6�#�m�D�i&2���g�冿cXC-�xf�����s���0��ج��<�������b@�9dJ	P����-��(+VyW�wn|��{�G�Z���oԿp<��^M�'7VH����;�pɫ�ҙ�xn��?���.�*��s޿2����O�D����b�b�h�j�^8� '+�;A'�$-)uj*���a��4����$��}��<��')�Կm�4�9��������m{�A��m6������Mfy��������AZ��%�-�(�  ��y|��f�Qf��������:��Vs�[��w��S�kN��=�~�nQ��De�qO?�G�NΉ����>=u�Y�-��W�o���w5�KmL�	��;�����\mFO_2GwvS�iO����2�Rϴ
��QPԒ/� ��|d���<q|X��_�gA��{�	�y���}~K�k�o��&K��^���D�3�M�،a�X(	� �(�£�~������P��Û�Yšʐ��������pb�x���U_���c:xGb�k�a�
�dk'���ͳ���y�C/ڴW����}��d��d�����8`P΢�*OL�nN�Zm��)��dƌt��s���S�Q����HHΫm� �G74ǆ@H�D�y �[ޮ�Y�17�.t��`��/i-Cb( ��l"x.�J�W���^�1~�8)�R[z�P�w�S�1Vî)Mc��ݺ{���}�6�Wsw���y�7μ�1�C=� a��&��'y�8)N<�<s��|�S�ے��O����������D�8��aSS��t4�]pT��Ҝ�mZfL)�d��y��Oj[vT�W��ޓ��=��4q���u�Z���W;5�_{���O�L�ܿsQV�½f��9̰�����-q��i|��s ��QJ��M��y�:owa��탂���}���Ҍ
��Ȱ��Ìm� �7*��|�|�9Ď���F����LL�#��HH����vl_�@~y܆�̪���6}d���)B&B�5M=q�(����c�vKͩ"D��^TH��^ܜUý��%�[��:sft>�;�����}��Z�����y=�]��=�sL��(� �o�^��e}���5�I�q��{����t��w���������8:���Q�Y�Ą��
r��t�����w������ݿ?��k�%��:�q��7�.������.�ʳ�ym�[����곚�6p8����|eK��v����t��%鐒3z��O�S��L�%�2�3C�s!M}O�W1�lp�]�Y��Lvdj�Q���Ѧ�=���Ws�j'��;p�o����f�]�g�shW��M��N�K6��@HV��K�  h� �~�u�  �""L��3b+Oi�.��(`:�kiy��ӣ��-�����j��G�o�/8����{�%ZۨB�N|�Kn����h?[?����[$,m\X���8�h�H��bIŐ�BL�3�(�m	r�H+OT=�3�x�'Q�a\y�Nt�Xst<A�	 �h�d�K[Q��hO���'G�9K*m,�B���&ޥB��d��)�p�\� �����՟?  п�ve�X^%������JU��6/�e=�^V!s��u�����n��7��x��w���o�?џ�r�����6�{�T��SY�?U�a٭�W��kh���'^;w.��\g����&mߏ�輿ٷe��#�Zv��b|��v�G�ݚܹ��q�Qp!����dƻ3k��������]r���r�W���d�K`s~��w��;�-��۶.{�RiZK-t3ʮr��ƽ�d��]RBU(�$wl�б�z����7�p:h�B�V}d�'"�����Q:�М��������;��V|	�G/^�D�:4/�B_���\_z�>�v�V;�s=�����>�ks��f{��7��XKļ����~����H0Lbdj-   );�1d�xjBhƖ[{-����0��5�?�9z ����ͼ����]��z�`��݃�ʆ��F��T�l�mZ�' �%���%'��I�" ��		y��ѻ��y��1cx���P�2R�p��9��!&J��c;����䷜�Z�6�|R�mw��%�:w�������������ߵC[dѧ{wV�]�9�_ʋ�ԧ�y���J����B�ƼH��`�AI	v��A�줩���V�j��]�ם;r,�xe�NL�S0�L�|���n��g;Q�c������ı���v�h��A���2t���s��7 �P����'�$�H%&�<l]�{y�s0pfAY�]�tZ>h��&@&J�p
ĄBE�!������K�W����s�"#%o�v�>�G�~�)9o��OFhv�!�Ϥ�Z�U�[h����� �xq!��ĉh4z��y�6f�/���=Icw4��D���9ɋ�q��8Q�aQ���>��1��mz�R�rW�#����+����oa����,ࣄ!�-u���! ��p �Z�l�.��F�G_.n�����i�g�<D�L����ޘÄ*nMCΒvh(F&t��CM�D��D�^�F���^�?V������-���a2g��t1�yB4�;N~WXc�k��H��%����nfk�D�3��]�m��-�ĺm�6ߦwIA�N@�=�Ih��i���i�i��)���j1�Nd&3�7�'�#$�r�|�j�|���%.F�_�w��:�P�ҙC?�kIVѴ�����(��d�6G�kOn�^+<rn p�|y�y�KsN�e���%�&Х` Ѓ�D�o0��C�.jd�#����tϳ�響~�o�?뿿�Wr8cF��I�$fb�.��\�+8��"��t��?�[��.�$"���: x)�J`G�I;�H	�h�%���ģh2,C1w�y�����ռ��v���!YG���{�ܖP-5[�=�Ϡ!~_�$z6�ȡE����  �0 �kf�~�E_qѣ^ ������y��8S��KL�6"��Y@A"�A#��)%
2�.9=��|  x��pgEE,^���&���́h's�q�7� .5ɋ.�LߟL�������Id2��Hl�&+sF�`B�-9sU��AY���������Ď!hp'�Qdg�䎍<�Ǌ�@՜5K�v_M�?Ht����Ap	>p�]328č  ��B�����8�����8,n Ї�8YsѶ߿�6avB�B8 �S���	 |���v 8( �E-�p,G'�l�ZoB��W����Ƴ;"&�QHSw׏��L)I$&	i����E
�+��C�e8zjɴ��Č9�xܮ[�q�,w��Ȓ"us�n6C�W��r�#s޺�}=�|n��?&8t��e� x� �x. |W�I��{{��ֳڞ����έ���[#fZh� �R ��- �s��P`��60�4�yG�1$ ��Dp��%O�����g{'EuƋm<�B)0�tY��.�U����\��y��cfi/3P���!$��swp��La.d��c���#A3k�C�"͹Ky�h�l�co�{�;wl��#ޙs10�)�]L�	ia.\�P{Z+�qC��'mrߢk�g�h�An�P.���fk�+�x��{�n;��p�������}�z^ޢ���	��4�"�n�O��� j�A����B 4�H�O8H�X"rbB
uI���]Os:Ta��T��e��ҕ��䷹��+�qPwʌ�8��h�p !)R�
����:��K�C)���n�N���W٩IK$T���YrFk9�b>�H��r ��9k�0Y�
 @]B�`�JM��W7�'  <������T���}̛~f9/o�x=?��x�'b��:�n P���udJ%'쀜�ߡ[�'@�y �T��3����k��i<'�n֪%���?#��oN�~H��S��BK����2!N/I����L&�0@����f� �[	�DJ)e� ��in	fd�
 � Є:�%?s 2��h�Ã@�:���H �)!	�,�Iш�we�boi  ����S�������������|�,@BA!Bo �dz:��	�T!��AQO�8�'tI6�0��u�ڞ�w�wx��8��.(��T�pVr� =����~����m��$8�H$%K=�L��I68V�@�%w��m
�EE�Cy@������k1��.�8���QY� *K�<���	�"6
o�"� ,4���QXX���=i�..��g��>?��i<�O՛,�_VO�eU�ф���Y��b�ub�(C��� �
^ �bm	U��w���'cy��;�$�����:�>B]2���ִ�I[���.?�_���o����۽�Г��R*v7������GV�')�n�D���x�M}:+�5qB$�ZSτČM�58Ks<'p��鹭(1�5J4��N�T�
�Fh{�F13�dzB�hI2�\����BA�=����fr�-�Kǯ� �{}�}�#�Zm��3�k�|
�*�L"��;℀r� 8M�*Z=5��r�����S}9BZ߿��'�	{��>��Lh��?��ܥ����u愤D" ��,2�� ��ȕT*0 ��<�DL�e����ړ� �2wj9pY����
q����M�T�Ji�P! ���,!p��
K+��1�����u���� ��8���Y@>��r��̈����(�(S! �f95�{4ӫ�޴tF+7e�U:��D&&*��Q��հ<@]M�e�\��������D)Td S�a��C������$��De8�K�e<�k=b@Lt{���Q��|�4w�0�z($��q"���T
�K	����DR�  �wKol��06�/D�o��?��>Y���T>Q^�1�5�*  �hh�3$h�D6z�RED�����ҝ�h�X�r(BSv����12T�O��:-�s�7��p�H[������ѬW<��JRH=2�Д&b�SlM�;�#ID�D)ǩ��Bd�����-y��EyM��x����<�&aWr��YYP%bRl \4	�Y����/�ݼ
.�������_ŇM��;40ѷ�?C�>A�	wxF��F$*4�]��	��0QxgN󴙫3�-M1h0������N��2�������Hmr=ٗ�{�q@�%�f���^�,i�u�v8�L2O&��ݬd>����8���s
'��U�aDw�-�lq��q��|�(S�3a�О�� ��:�.����L�6�lՙ�zc�Ѕ�Z���V��1��F�$�͛��,J�/�8H�*�gx�$��d�78���y]�z�o<�&� *��O�4�m8�p��Т!�PN&�ܰ2�!%���p����ЫWgB#V�b/�W����2�g����wHh;�pa��j\���RH� �ӥJ(��čN٘l�B�D$��������զ#uC�t���� Z��1��a��n.(;IڹBh�ޱ7�YSh�ԪS�&�i�2��2!�X)�:� @D-m�A�a�(��������jǭ??�R�����Β�ÌqN��Y� EPJh#�������l�(r�BI����k�ѝӧvΥU��juit�s��A+�������T��� ���0jV�������C:�pe����C�����ՠCcɠR$����ܱ$���ƻ�����G1�m��+6���)�^����I�2���R�P��dN�% @��ae �ˇ���um�sY����vg[�}=ߓ���NNi�R�� V
'		�H�	�<c��.�#����z԰wo#����xj�*��?m����h��2s��ZkW.��b�< ��+�8(��%��F&�����	��&S��C��vF�&�r8e4��jpA\�%E�h<tu�J��K�5*��de7�8�~�O�����\h�'
�6�|BK#Ȋ�A�8��9�=�|\� �Ks����w�y��"��e�P(���D�LLP���1L����T�I��������
��`NL5,zm��Wɷ��~���b�6�����l������p/��l���yp�j����8=w�0�T����$�mi{d���aP�h�UL1�6�$	s]$m��������[\���b]��D���*���&+J^ 8x�,c�!�%"��9qk�6%<b��X���ᴯ��-Q�R0棆}��R`(  CAA	 �=�   R��k<(a�ɖ�jZ�n��1����ަ��r�N	�4��5�����8,(��U!�p��y�"󜐈�%��)rZ�A$�$.+;�1q�
IC]����_�A�q�Ѻ]��%u9C%R:��ޘ��6�.��@K�c�J�B-4>�� j ��E��:��r�cn����>Ԝ���Ԇv�ǳ��0hxb�p����Z���U����v̽�mmq{�������d�>�'�Z���E �mk�$!�PG;����SdLBi$Na��+С4��`lIisU11�r�]I1�H�dex"�D�#�e=��hpc���Z�M�(&��y&�������k�
 *�'t�@�E���x�]K����v�K-5U�B�3O�XԖ2��BX�Q&@$P� eׯ[����i��{6GW��׶�w#)My��B�}�P�$EP� PW�I����uG�;ԡB���+?�ou��4�Ļh;��i!��"%�L���A)��䍨8��A�D�XŮ�^%db�����4��d��P�ZԦ�Ó���� 	� Z(�������	���^<��  }~���t����_W���p���M��]l0�   �Nx�	�qh4iU%��vu��}Jg�����f��ܦ|�����9e����Xzt���(;����{8'� Ĳ�;Z߹�ߍ)�gA���Bz��ba�߄�{�n�����L�1�Ύ�����G�^sK�r)7M_��C7��Q� ��J�gd/u2�(�#
�����1�^l½�Q^�� �� �
�P��� ��X<�е߬2����N����_��^�~��j�b��h� 0.�  ��Bc����qzr{��ƹ�̩�,��Oᆢ�'@e��Q c�h��tp��Q,#�t�� ����:�҈H�ĕ�S	s-�婡�$��d	 O(���*�\��.��� #����K�1X�C�`�p(;4�2B� 8 �x���,7��e	 �]�x�n�2޺��  @��6~z~�����̚�uVy>b�;   `9��e<�&GZ����$3�=������g�5�f���?��F�*R�ė_ HVJZ�H�5��Ň5�ʅ�9�F#2���� Vкڜbc��930 	E�RC�$�� �@���F�ID���h0�*1)�$�!V���5��eb J(h� �	uYBB] �"V�#_4�����u͖�A'�{�/�O��*�Cf����Y�b�A  �@�% �,昀��.qi�^L����M�^B=�}; �m�9�O|�  DgI^��Y���='��O �#�t�s���#1L`@�BT��Z���_y�_1	�%@ �j�x��8�F���$�6%I	�h%WLb�i�$eic "��@  �؄d� d�Ea�F������ 6��o���18��f�J��^�YҎ����d0 � xph @��, |YY&�H�b��sw���j����ۊyD�;~9h���m��(������s�֭�'��C�"14e�q��ܞ��v}�&w+�ŕ�\�Q�6�̘9�ӓ��p8�As�0b�@/��{d�e?�&,|������\��u��|��	��,i��r�R�EwXH�3 �F�59˚�r�ab{�MFT{q�^�����}ۧ��fn|�5������鹺.�CKNB1 (�8 �&� :d�1�܈㐋Biɏ4ñ@yڬy���D(,K��������u�F�.��W��_��[]$ؔ��9r��Q���%�\���j5��R>M:��SJF'@� 9  �4��a��* fA��E��h��Y�P����
����QL��� X����>F��g�eQ�9K%�v⃯J0���s:��|6���!s�$�H#�@ ph���Y�C����nk�O|*!6Ρ?�5)����k��{�9�MG��k�;�zf7�������e��|��S6¡�c\�:n�e�X��ऽ��u�s{>a��(yBi�-��,+�UqT� P/���
ҵN	���%T��b#Z��� 0X@C�g� hX�C��@�KF�CJ��nL~�y�<z���=�v^ @V��s6��|��,�vY�����pX��'fY���m�Y�4��<��m���aM�
w��;ֆu|!�O��+�U)v�82]�ܳ�8�~��v�����}R1}Zy.\V�Dp�{[��mZ)��,9���O�X#��*J�(YR�P<�]B	%� 0�9#$q�Y ��`K@@!l8H�
� �h����A����CZr�qk���ߺ' �K. �
�!?g�ɳ]u�\��ZʹB��O���e�5,�,yp�l�����<o��ưvsSÓ��wj�� 4s������C]�{�\�3��K+ą��y��G�η}h�r]M�D����w3��m�-�r=Ȍ&t^yn'B��584'���ϩ�:��e���;�t$�!��/	ʓ�Jf�є��,G���JN�� �@�	��g5V;�0ޱrM�H{������hrq[����k���' ��\6� ~0�9�3o?�*��F�j@�K)�p�d�C�ŉ{(�NV�j�S�N�9����؀�<Q��IБ 8[����J�dR�*D$֘����������;ּ�D�C�<#�)��g�|��4�B�$w���XJ��V1	���IK�X8I	JDA�B@HB9�CK�q�r�8 @�,��� �3��7g��G�ݮwN�S��,@zi��#��� �����9}��;����������ݬҵ_` ��zEk��]F'�p.��a����B[���p�40p`$�l��ahm�|�2V��<�$�p�Q\u��w��;�_&=�j�������z��p
E�6��!�4�L扜N�',*[�A�&-�1�z`��FR�ظ�=��)�BAx�e P�-ZrB(P"&Zrb�n( ;a @��,��� OJko.�u{}��t�z�e�<�'`'ӏ�gx�  �w  (���{�o�v�3WL ����>�tMrz8$G=%J^K�ےw��׷t7��|3��(��ZҢ������-.��ɑ]%Wӵ�ݩ�8��o�>?}[]�]�X�Ԃ�V"�!b}�>����F��ă�hm�`���b��
U�%]�^H"���I�5 %r�$�.C�bD� If�3�vزĊj��J�')PW�x��I��|1g��7`�l�������� ��� >���<��.��v�\ES�p�aY:i���ն���e��k����iT��S|�=՗�~��8i-6�SҚ�ߌ�Z����CNS�iǋ��XB?�WFy��Ljr�j���}n|���(ɼ���̚p��آ�xs��_�hZ�c&��Zt�D�\��^!)n�d���$����P!iv*� > X ;p��C���K��Mi�t�H&��E9nvM�.���n��5��t? �ɭ������ ��O���gw}=_�����������B.�"�$:���s�s�E���4�n���H-�KP*��<иh  ��a �ڝ��|=G˒;i��ӈd$�Y�����;�HB E�J-Vj��@!h�����B�>�R��P�C�IWFI_�D+"�21(V|��\� � dy��*��F�J*uRgE�A�,���   Lg����s ;�g ������Ӂ�ms�-q��⬘\pU� @�Y��>n���c��_��7��x˅6dN�э�>c_�C��w��B ���h���ʭц/����}6��N���1l���Q�n��℔]n�����!A�J��c�	P Z��Kw��pB�z	R��Vr�A��� XB�M�QIV���ͤ�`Y�$ozK��p�> �S}�������^�8��?p�ȷ�K�4�+�E��*�0�s�i���Fh1��O:쬊(8��i�D�L�P=�����59>��
)�`�,��M�T�C~�'��4��ҰŇ���jj��%.)��A�PJx#b�m�=UZ�RN,1KJ���(�YK��D��C7
�j �#��D
�T� �5H@�؅I	i2��C�jn�������o�������4(7���ʗ�����IϚ�@.�he����2���nnǽ���;zm�̍�|�O��'=��p�ˉ�)���t�'�`9�|��$U���_rFE��<ԒN�دok��[�1'9�m�:�B.�q���!2��͑�$%��@(E{_m~���Umt�1I%4�3�F�"��QZܲMN�R.r0�W��Y8��]����]��X�'�Xh9�&l�<ܶ5�xAv ��ω`ƲS>ũ�e���5���摥o&7������~-ɉ�����a͡����Ģ�ax��������(�����0��4l��z��S�(!ANKRF�3�/�N�q���4�!t ��L�IBà����&=T7Ӄ5ٲ%c�YCC�o��X�E7�h� ��-y�šE�I�8����e �\��:,�e2���������O �檮	9:`!d�'8�an�����D���nu���� ���6?�hY�G[8�q���)6�	�^M`�9  U�$f��:��8hȹ �@�NB��$�C�Ḛ�%m������[oqI��e؛欽��M�5yc� ������XA
D���MNPRhF(u��b4 u

.�jy)���/���  @>� `�!a�9*�I
��pW���~����Jf�.���+��Kĉ�1$I�aND/vF��;IiM���E/ z�2��M�4���9�H�Q1��q�z��E�(Ǳ�zu9�Ef��du]��@i.�����8��0�� >�RΗ�U���rqȌ�PM�����<��й¦Da������	��_��| `�������a�4�B	��i�3�u�/֠�[���x�rCo��K�i��脬���}�S�'c	@DrUv��(T��O��WK�t  g$wM�J&�/Y���$�BD΄����IӴ7J���tJ�er&�(7U.��n�-*Q.26%xM)i�,q��ww��8[Hd�(�j��?��
- C�b��e,Ѫ�iYJ3�=�&�b���8���{��U����f�? i�����Ng������V�y��d2�̱6�!�wA��<tmߐ�ͯ��j��4�5��b�E�xY"tQ��9\R��gBBA�_
��|�!M��ɫJD�� e�M� �#gԵV!��`ɡ�WU�a�Y�'�n�<�}M�yc�����뷯���Y���_; ����ǻf�����\˓�W8k4�/�h:�2����"�F-A���:�p��X�d��*� ~H��?E�S��N+9z�9X5����hC��c+�d���jh�N�ۚ[�����<�'B� �,��#: ��	��O#���D�I)W���xB�3,O��¹�$�S��pb'�a=OܣL�V�ms�č�͘Q�޽�v����v������6���/>>�߿������������^���ç��/:T�Y�
�MH�hؐ��JR	����c-r־��%ay+��P  (�|t>��{���;�M��P)���n�9%�|4�\���Ѐ�B��#�C@(�m�px>ܳ�r�x�" ��u�	�ژ�9e@��ɉ�2�[p�\�tX�P]�\�-*���Ĳf�)���G�ל��������  ��Ǘ߯�>�۳���ow?�G�'��DCh8P/u�W@�e�N�e�TɲW�c"׬_l��{��oo o�5��Ї���/�ú?U�P䐹&��$q?���Om���YG߰��(ob��r*�}"��ྡྷz�E�Z+@��f�Z�Y���%'F�X�_6�ZK:��KV���X��r^ͼk̴L*f_sH2�h��w�-�)I3Ǧk����f�����9�%����k�����<Jv���q{�;x��w�}�K'�����3VA�j�^�a�񌦯��$z�����F�M���^l� �a�_���K��/���|  4�9:0��s]4�@���e.#9����������U������x1���x�r@Ǥ� �,��Q/���#7�JY2���_�"�bO�!�SZzT�SH�k4Z�!�JJK
�7N*�!��֍f�;½~��'V�9���eu�ٽ�/  y?�b�����5���܄�=|���,�������ڣ����o�;������|��o;}� @.[r���Ƣ�m�Kf]4�K�0I��)��'���}z�][���h���o���_�DJ臰搩I�aɮ�	-5X(��kx3�;M��ִ|��/ @�H��Y��h(���er���\Ǌ]�(g���ͅ��_�Y�(��pޑ�~���оF��`��}�b���|�_| 5Β\� ��y���Kg�/4����0��Gcz�x�����_��՗V|�������=|v������7���'��������r7�K�8M��)��L|CQ�c�d�^$+��s�e�������a8��"B���=���D'ik��3����ɓT@itBJ#����(,1�R24���$⛡Ǣ��������>��N��aa=��}4  ��rL�;`��gQAG�2	S�_����iҙ=�k�.���� ��������{�������_�YX��<Cw>Q�#��
��.d�s��V4��p��__��ߡh\�!|�I*�"B������s3�s�i>p���1��ז�\ρ�@�G�8��Jfͬ?�rEg#�S�R=���g}n�t��������ne^�7߯�
�N��	 ��_�]R��z�.1��F�PL�
�Y���:��A}�/_�  \��4�����������r3���o��K�����_�H�z��84ĺ�#�{��զ��5`������ꀈ{	N�j�H��p� o��F8 Ԡ��IF��(�40�.b-
@b�K���N
�cg���RH��������oc�?��   �   6h���o�����6�A��yоb�z=>  �i������:X�_��D/��Z�� @w�7�/j8��6o]�@�Y8r]R�L��Me �r�0'��^�  ��t,���@DiAA�X�,��\I�H�)���M*h��O_�������t�o���v�Vp	���?�	P�0�;�"@��¦�'���L� �:����  p��v����ω� �����zZ:t܅��AɈ��������p/��]�9*�?}?���%����(�s��/O�~s^k������iK
��r���� X�,E"��u�0%Rڡ�hh�zH�!���x�I߻ Ȯ����<l��5��]9ȍ�{P�[�E�sPQ�|�'啀
 �{�^�*7._��>�!����@��4�-㯙�Ei���>Bm��0�W�<�yV��=ts5��c�O6�hO|3��_�Mi�K�.�T�3<����O ^�$)/�`�8$`��
j(���"�-�c��ơ��M���[<��|��e�k����>��a���Yx�������n?�o@ze+��ѷ����2�X��쾤P'��\E�F7���1`
 ��_��j�� �N�E�P$�dX�$�[hd���1����C��;Q�p'�}���k? �;��I�P`�BL�b'>��*�@`�A��M4��PX�9��t���F���ɚ��8�q ���[h! �x��8��x&'���x��� �8�5>��<&�J�*]e_�p��j¾ax��\M������+9XBR-�B�&]��SƖ�}�	��9F�ҷ<�M�t�li�D�| 4�h	���1HS\hb-h Ȃx@,ܡ�X�
�z�f�������֝�;��Gh"��,��;��co�hU�B� ���~D��9�yy|���l�'I^�5E%��%C  �q�h]�5���K�ɏ�\"�U Xi���p���:7� <�p'MW�J��>e?!�{ ���p���&h`�࠾<��]yB!�{��,MlABY�P�гPi��'@�6
)�"vi2�Pi�.	#�Zm�1 (s䯈�?���_�l�E����s��hIڮªQX�!8 Y��`�A|��Ϫ�����Oh�M�S,������,�};�۞M:/�0T!����6�w�Ѷ�c�=_\��h�%�h���G�I��p�r�P���/�06eV!P2dSNJ�%Ӊ���tp�]bgm��6=�� h�X[b���yh�a�<}���Ŀ�Y 3�����7_��?�aOr/k��0L�r� z���8����,���Jk�7@�<�e��Qju�z�'gf��g��K�2[�vׄjה��'lU�ȈE��^2�&[,R((Ơg�qC!��Vh(�5$�j1Dj'b+��aMq�C������AD��Z�:��*�K��~�  7����s�����?���v�^}��B� 5 F��>��> �ֹ�g���
eqP¥S/K|8"R)��UW�޷DaЫ�2����ZG?�22� :�5�A8(�w���Ea) �t�2��0v���[�hA1�$鬝J&q�hZ�C���fFHԫŎ��c�J���	��F��O���o?���5��#� �Ong�k��^j9�T(J?��@lR�6پ*��z��+�'���"H� ��d9�X��::
����Fy=B�a���4���h��� 庌]`�GBC�h���C��0B
��8	�):���6	gM�zK#�H����0,�9	! .����x�O�Vq �
DQ���~���0�/��:�j�L%��ˬ��$�C@P4������k+u����FgP�y��z�T|��'>�T�}�����}����h������y��n-}�����S���jɍϢR�D�K m*�0`6�5p�Ob+KpЃ��$�]�ݎ��%��z�9;�1�u���\CqkېFoAj%����)^���i+�  ��c�x]���f�k��$��D!אX2�HFK��Ug�%n"��z��xs8'����������y�����&���KX�B
��q TaRJ� !l��'\�!�� �+%�<�V���Hr�`���Ш���VtRo�T�.�9ME3R�Z�ϵ��E��81�M���������i�l�6�^:gYP�RM� ��B]l��)�� \���!87��� ����������[�sP&_��I�.�n����S�k��0)���A���5V�␦B���'+8*�dA6w�(6�Ali�[f��K;�T�8 ������6�v��5��X;�|�yBO�ן���iKsq�-��
\�׈�VSB  ��@A�����EN,X�6����IJ:4"0�kE�:I����U��(�g��I�<TL�2�j�	c9)!a����8�h��PA�[!)�8$�G��^���8v��T�D2���ޞ,Ro��L,2b+�X���Ş�_>a�����Hs�.�Z��׋\�}��@�P[�`�Ϡ]�XJ.\��O.��Y�\�˓�O�/�qGz��E�݀hw�\����2�Sl��iu��M�3��О"��ͦG1L�Y����+���zs~��WnfM�b��(�!��*ˬ�&Z�d���P�ߔ����j��,��%����ZL¹��9R�3ďm�|�ٷeB��ݮ}��f>H q�>~��砽��:�p��H�$�U.oR.��W��dC����d,��P4�o >q�`ѓ�%�����[k�4� ��'�ʝ6LT�,��הg	d-�a��l����Pa�Y)M|�0�����:4e/���S�Z�3�@o-�:>��$%� �͉�К�:Kƺ�y>��7����?zO�y�~����5��O�&k@�7+�   �M�z7 8�����~��OTl���dW��:;�4i�A�~���<r#%$� ����c����0��$�!Y�BS�kM.@�ќ7J���j�9d��I*6dԑ�(M�:��P�:����?zO �Ӹ�E��ܛ��\ϢP�1�#�@-�d� �&~�#sހ'<�zh�� s}�w�^�Ĭ��<c�!@l!�5l �	MF䦃'C_�dZ
�(�
!�KR!�a�Lo�Z��"wb�	�V_�sC����փ+u���B̍�NU���sϩ�Y��{�_M>|�*^�pOr�AQ"@{��p0 ���j�e���8���N�ɻ������~��h���2/�]Ķ���G�M��6���r䍃A'BRZ�aSN��&��P�_\jQR�����CH� ]�dŔ{���oO�������l*w1�Dǚf7nfc�'�$3�! �ɳ@��{ �'?^��  ��Y�o���Z����~�0�	`��X�g�ő{��\C�\e��pu��;�}�����9K���̖$w"i�-y��0[�#��OP����7&r�,���<A��	  ,��$�w�',�o<+	�X����,@� N��5 )ϸ  ���d�AƟ>~�X>�� ����?���s5�<_�^�?1H�0�Ī�#r�ం\P(��}-z���a'��k�~�2lE�j�\0\��8,w �H���!d�r	
�H`�O�(�g m�
(����H�k�Q�Ip�� �7�P  -���ы��?x�B@\@lBR 8� ��i.`s�B�,�U<+>�8�=+MbS��ɴ�p>I0� A� ZryH��P��P�,GD
�X:�f�-���I�_cٵ���^k[ܓ-9�xA�KF�"�dv��P�k�-JB�V���.Ec��1��PX�����WK��C��ߜ�	 �i�'��J(� ;��c=��ܿܞ��Z2Kg�v�1B6E���P`��AH	�
�`�+|�7[�BS�,�p��s�輣�{���I/���a����M�����>g�L{��NmU��!�xɁ�liF(����.$�W�<�
I�V�ԥ�g��Dzldj�I�s,R�8Y�-@a�x����'��8�Pu��� 4��h��Ͼ�\��Ǿ9�ٯ�]:}�fV|�U�V':W���d9�1�:�U���˦!�"ɍ7s��S��T��/>�`Ĳ��C�E�9���M�}^|Rz.Qh�Q��UޚEN�2�N�қ �I,$��,Z� `�4��*c�&  ��;`  ���o�|��<�H�E5��g�k��H���k# ������ �]�G���R��l������g�R�⹊��W��d��C0��M,��O�)ǯ�UW�Zv�NW��)	=� K������.av]���#\�<��0��Ih�{�.�%K:���"�2�#R��%�Ub�x�e@�  I���++��RbVK��l����A�Ҁ'P��c)�ǯ�� �_~�����_>�i�\��ͪ��u�Ԓ�$h��ڗ
�˽�"�ڌ櫫�� v����7��r�t1��_�����@qG�Oh/�;_�6�U:�uH��L@���-�^��'�񆇸��N2��E-t >�"��3,;�.�0kK
���� ��+mV��i�� ��e�/����f�֛Wg������5   ����������>���t�mp�$��]���e�*Q�`����cJ�v��][�-��m��<.XKRF��o�S�>b;�d��'����~8o��������`�������nS�����F��H�u�^ÄJ�C�iHNr�ZE�����cm���>��0�8T�p��wOO��=���<�Nl��=�~_�j����	f?����3��d֝��U�T�s���c�\on`�zm�ȥ:C\p"����> ���u��Wİe ��p�b�{;������+����_h����K�������qZ�P'�������"��Ϡ�&T<���`��[1C�X��3��"�خ�5�+��@��D3�XL)��%��}���������~���j�����S� ��~��s���6d�r.�K��[��ChB(�XMp�p1KD�����?��+��%a+� pq�#w�'�{b�5�5�q��ӽ^H7W�oZ����n2$8`����Zo��l���M�.4! x�]i�KN&��Q~�0c[k  �v�R�+9��q
F8�Um��D�u�ڙ�y�Y���������g�  �������]�_�>כ?F��Ir$G�d(Д��0^�JA�bB�d؀
����n�rU�-�pq�  �̱�#��5�s]���-��H]��=Y�����]���7�,i>K�kN�(�^ړNz�E��v��)� �t���9���8�r�F��5z�!��Ѽ^�P޹����{>C��N�Ǽ���SD�[0���Uү� ����>�6����k��UB&ڨ��Z
Bؔ�f��i�&�,�!�����'���,�H��cޥgc���<�cѝ1����2x�"&�W��{+�p��������n��=��=���~��3�o$��>���I�Tg���a���j��W��I��i���-Y����Fh�BM���!��N��������>��%�X������<�}/���_?T���s.�����8�?�]��^C_�9k�A]	6�v�&]�fR&�Ú��Kք��� � ���Õ��ؚ����wW��^kSJ2�{!ϣ�   �;&Re�: </v�l�K��'���>�},,����׿ϼgY����Е��?��.
 @s =<���I�����į���i�ʗ�����?��^� �7�m��Jw�����ѹ������o��K���h��׷�x�j���o�g�>�ŉ�l�5c�+%.C0�2 �dX��g����̱5'�1��Ž��;�ٮ,��[��C#�� 9��	P��{��S��4�e������nqF��"8 9�}�d�kt9r// @���3�d ��d/�YY��40�@Dl��[������o���Gﾙ_�����</����y�������[��?��˛w��-��j�|� ��*r�Qυ^C�r�{glJ6�b�LJ�4hA��$�����$  ��2��x���ş����Y�.�"=�p�s�C���V<�3�{�4]NM�v�=sxP{���>d��/��[��lf���oֽ�  *xB]t���C����lФ��SL��X�~�����	����~����<��`��oZ�4�O�u�X�����_3�����5f^q2<�^c�\|��'�Y)�c@�M�եZJ�o�d*�8{���2��wӳg��$e�,���Ų�	=<D)KjR�-�D�<���0/{������w�,k5���p���������?��Pf%����C3=Vܘuך�Y?�I�'9>ʧ�.9Į
xs�����&>��7��r���_������_�i2_�z�������fw��K��5��S�N���\.O������V�1������Z��֛%����zAFY� ˀYG18G�5{�(���I��eq�ͺ�ʕ__ 8�@@Fe����3t�w��������j�ማ:cϘXU�[,1i��z�qz(������c~��?������&��qO����c�6���#6!),i�ᓎ�2:�I������=�sz�*��L�R��,��6 ,���}�j�������~�{i�?��͒��o����ɽ�s\�׃s�z�4'a .�4�%A,O�D��hp����.�ό������������Z<+�C6V$8%���'�2"�#����#�Z�4�M�������ͺ�������I�z�p�I�	�;�VD�6��un��Q39W	�S�ͨ#v{t��G���]��~�6��ٛ��?��:�I�k�D6lDk���2٤�Y蚼$T��j? *^�k��xpP�0,���qM���r��� ���HF�rQ�p4`0N�"9���F�<�a�ȹ�d��|m����~�;�ab;:lp�
�Y�M�LB���b���Q�<��Ţÿ�b/��;�Vk.���&��r�;���ݷP���ih.��d6�P�{�7���4tY%���0^r�ɘ��"�E �:Rpc!"o".���~�m���|. ����/����lВgL���fY�`��g!�,�b�4Y�lʉ��b���,c���qѱ���F(�|V�ۛ�Y{�n+8zdԪE�&�p"	S$��nƬx�]w�̋�$������D�2�f�폑���yV�kbt�\�Wu�5��E斛4p��B�"�^��0Rҕ0)PY�4�69�fvF�����N����ӌ�r��ʝ���U����n�W1��Ȳrx
zqaK,I���I��.ˡB(�y2E�!Y�0���ڳ��.0��1�A�e�H�g���E��7̚4���:ȷ�UY⡞�B?	W��9"4�f�rѮ^��O���̽w��Q�t�uu�,�Zf\tu" *L{I�A�!)�xO�&�pa�����$��Y�� ����
�];���U$�K�Y�2hy�XE�bV6V�6��Rq��=�%]YZCV���٬x1���M��&/j�p�(g+�A��l�rVh�t2J״�0o(��U�kSʊ��F{=P"q� �9i=7��������L�M�u�(��a�eP�E����(1I"�d+ϰ��*$`�1�/�b#Lx�Z�����O&�;�**�ϒ��IqR[�BE�gP�&�+f��y�+��t�!#c�L�2���Bn��jĆ�Q��C�kb�	`A�.$��D�'��V߸Cr��^n0_����nB"���G���� �I,��Z���Kn�񽕕��jF�e�H���uyc'ҫ2B�&fY�C���ϑ�T��w�)bP�����Ĩ   �ו_8*� s�
r	���QY��Ʌ�jx<��r��Q-E�����%�`��h�;6ɅL�fe�J JwRt���AY���:�6��U;ĕr��t��t7  �9��Y4���Ct3����7p] E�{«f���#���IB�c�e��
e��KF�u#�ͫ3�]u�e��_��e���JH�gؗf^�d����]���?]���h>?����P&\��r �,�B@�sY�bB1I������5��!"a�7H<I�QB,B���-  #�$�r9 �A� ` \0�`��,*�z�5��Y3��7,�O:\D���3T6���z0R���[A$TM��KH���s��,~����N�A� û�u7r�U}��l��:?ٻ������ ���(K	��3���<����@�����$���2b2��R�E�4\��K3ȍ̒��T�$�Р��sh���(\7h�yэ�����.tx���N�'�Վ��u �Œ�� �<�4��r*��%��!'����ԪE-�.~X�����P�`e�a� ���]��� \u��4 �7 @@��* ��as�9�,����%�Qe�{P�u�i��$�]�2J�a�j����)�Mmȁ^c���KK��&������s�  �k<A�B�d���'&���"#(x��<k��AG�r���"�i��6a,� ��V�`B�qhB��[��f�)��W���3��B>��7`~���N����X���e~�����!oR����=�ф.�u&-�r��ƐC�M)L����cĪ�,MR[�C����7yS?��i��d�Z���ݍK&��K)S��9�_��Z��Q�.ꆲ���7�������%�Máhf��6�Hi�l:8%MX\zH	��o��$���:�3�Qu��'W������l�~�'�_�2��g�^.dЄ�O<K2l�&:�6��Czx�wD#����ZJB�#D I� ��.L�#$�}m$?�Z�
�h��,Ϡ����   ���5PV�D   �9�P��b��������|��$4����Z|B� Ojq�M����  � T �?�~�?s�6?�2��'   �Y��߶+�y��W�"q�	�l@M(hW��%!v�F{t��J�������D����a@ �A���ưIrW�� �'h��Cr ��	�P0dQK1`A�H ���K����+�G�l��Sܗ�����B,4��w ��I�!�2+�&u �Oh  �~p��W؜1;߀s@�x.¤�즑x��&ԁ	:��,?2�Y�7!�=�rN;(�3�]�$)P#
!�u�^ X�����lGH��
$(v�^H|�xB��z �`��pX� `!K�'1��TD�C�ZVZ�j�����IS�Y#b�!Ȑ��f�h�^���1q �zyJ���� ��l�g��.�0Ϸ���a���5NBS���ʃO8�,���]�1���H���YW���͞A�/뎋��F�[r�.�$b�*T2�9K��B��^w�����;��5F!˻�c�8��5�VӉ���[3R�	Ϲ����+�'���ѵ��+�b���ǔ��ɕc��8Jn�Z#y=����Rd4�$�늗��0b���e��M��B������n�����?��n;�b�4�*7$6+\(Pb>&A��;4�s�I�c:�u�r�d�u�,�slp�
bPac���i�[^ӌ�O��P�4��N>4z��z�Ԡ^�s�!7"����o����dV�P����k�iP��hg�&b�q�D�K�]\ȡH�w���X1��kL�� D�"Pv��Ǘ[�>\is&]>۔���!�K���&�J$��@�@I�% q�g�Ĭ"Gt��zƢKC�e3�]}�3������]�9��ɵ�ސ��M���5�+֢L$�w<���� \8��6�K
u��G0s<3�G<�#��k�W�#�v�r�C��ͮ��`���w�Ds�^��]�!����A~I����&��7n�Ă8 j�ɖ��{�,�ʜ[[��"w����U�4���O(�'.H�[*<)��g����Q4�/CFF<�27C!�:�I���]E2�5Mnc���Z��w�V�G�LON��"�K}t�J�I3~��񨏺����.�h7WB	1��5m�+�3g$zm����������8���^�G�Ph�Ak�rx�  X�+e��4���7s�Xh��^f�%K���B� r ���B(s53�^��h����pW�
{�yԽ��#-"&�6m��*a��YH�b���DK��XS���R�Q^�6���+�F)���3������[�2�<ǔa���6��kȹ�o4�Z��������ϊ���p%>q�HB�9�!YOt��ϳ�^s�̱�AY��
Rvq�� j@|BM(�	 Xc�A�.5`���(iHYh��+�AME��&���Z��t	�y�Y�ˊ$�"�I?#-jI�т9h�M�'�`�V=*��#����\S����kp�B�`B��޻�h�%VɈ@p8|A�	@K: ܂ h81� ��7����Qs�?��<���������(�*]B��7�Y���C$� ~1�1PC��!���'�e�Ei�P �+�C\�#Xu��5th��.�8(  䦵�!.�P�dh��&��EB}y,��D�«�Ud�T���Ì���r�6-Ր�!2�^�Ik�$ZA @'nY�=� z5�X��� � ��A�ᑜ�����ޭ��J�]C*u7MwI���!�e)�2� @�`0x��0X,t�?����cRB�K��8/�!s�h�Rh�ZtF����X�0�� �Y%X/Af�}�Y�1�P=���PO5EbAK܇:S�"�K���Tu�}Z$! ���� ���M@ V8HCg䀋�v���W:_[���ͤޚ'I�+�U%��s-g��Y�L�iP�Mh��*�H�l�C�L��a�1�U����͙W��sw:+�����0�L, ��UMh6��IC'%-��CC�I�e�=G.����MP�AW[�L�	��e��'Enw���<���^�,*)d� � �X�fE�o�E� ���$V
�%��U��^Cr�k�F7:ݮ��Ó8c?L?~�r�qŌ�  �@�`i���p1�IK�{�
u��r�|�,. �7>k� �c*n�L��� � �� @Y��0�P�`G0 (�V2Ѻ� ��-�A]�d�,o  �Ɓ!����y������^X�>D	�z�Z�_��ϐ   ��g��9yZ꼚��	�0�,����  �m(���j0Ae�7��f4���GYd�&�a}�=<��Z< 5g�e�H�P�%]@��P `��#$����d �@��C]��~"P<w � H˱34>qP� 7 �/CO�`�r�]��*!�rŏ��/����
�����K��g�C|���s��A�5�q,N8�7:x#ː�O�l�3�%H���Y� h|�]�O�h � ���-[",d ��b��o�s�'�;�  ��HQ���n���}�o r �4*�e
ۑaXB�K���r��eh�KBSX�W5�����&�ݛMo��e��,�5ϒ���3(�;�1(�D��"]=���:�Y!%�fDP�#tń�ĂA�7��b���z���h�$7)��R�,�(.�+uݵA��Mȡ��!��2E"q��=S�rBj�F{=z�f+ ��!X�7��0�y��k8Óx��:��M�%6�$tb}�Ĥ�&��6P@�+��_��/ (�&��x�t��sY��� x��D���� �P$	.與h�.t nQ�Π�\ ��!�i��Fʂ ��,��aȮBL�E`熬� P �o�Sq�3�X�� T�\�8 K �7��.�xp�rh��q��j�X�n��p����N������������_ ��+�`r���W��$>AA��/
����Zc���E�%!B��pVh��Ai�,A)c� $��gC����d�� �D֍;�� ~�1g�9h� r� � \ ��	� ��$�s��[�Gq_��.t�{Xs��v�%������շ��N�����4�gᐌy.&�H�  A�pI7�X��(�"�C���.�,J  d0B�:��B���4� �*f�r!0ȹ!먬!< ��,p w���4Bs �"Y�c` ��O .  8��'~i2x!��t<h�����@xE�|>���������|��cm6�Z���|Û��yyT:�mGo��R;f����ez/��#T,v�	��Aia��������s��� ��hi�	/� 
~4s�f��B���hX��4�sJT���0�p@n2����n �΂�{��iR���9�l�O���������Wc�>����_�� ���z���}�]�2 �: `]�ա���qXA�H(QU�,��gߎ�L �1��+hC2*CQܙ�%B   nycP+C-@,
ibb��  @�bCH  4�0�^  `�KEgd���W=UW��vV�#���>?�O߾�������  P���Ir�葺 � ��E�I��ħ��N���C�8�P�f'���Y�E`	G�q2����r�qA!�@ʖ59�� K�E��h   �v�� H� x���KN��u�:����� �/�
�W<_fWs����F��v�. hbš!tqȸ����J�
ra�����^d�;% &a�x�d���2.Q; �@ 8ٲb�AC�l�8H�H)�-�8 �r �`5hC   �N�C�\~%og��'��Y�m��~�ga?�"�y*TR7ԥqpFތ/^�XWi�YY`�����e_��D�1B���Ҩ�CG�d�\	����)T`ؘPy�J)�\*U^ �Ap  '!��� K�+� �P(��JP8CF
��^��k��7z���Z|���s]��y���kxV�;��� ^n �w�Ni92F�]�A��  ( %*�b�K�$�Kr�dD2�r���z�đD`�2��H #��/�@ �t	  
h��� �  G\ 0�k�b�0P� 4�% �[@J��wg�\�N�,�}岯l�>_��  ���0�$�� �]�X 
u�v-��I]讼k����w��,�����ٲ�xT��b3GҏD �  @ J ��$� �8��P��.)x�b�Nd�hc�8�%'�hRw��h$�) H��,��Y7~~^e���ۗ�~G߇��	o�.����  %�0	�r���=I�R�]�+% �"�Ei�eTB ����)  pTp   �JRВ�((Ć�8��I�9CN�+��F��A�[9��I��")IRT   ��u��W��O �<�O��i��>?�7���+� R�u��n�k�w7�:�Vx_������.�������_R���h2�X�i]�*�;=��4�VO��R)bB�� #���K�  ����bЄ�]�*Ys�L3���]lQ�ˬ��<�:�AgE�%�<m �JX,��},���}7������N�aVL�E�y���r-�/���ؗ���@}�^  ��	  � �%��Z�h��-e���px&%	k����f]Γ3�)Q� A�T ��*�ȹ�&g,3.���}��5���W��ȣ}  �;��(a��쨻
�.\�p���:,oYwqc�ޮ���K   �c��a�M�Z�s�X)�d��u�6N�A��<C�!��-Z�BB�4�K�l�Es�Ի*LQ�CFN2�M���a�5d�� �x�Y�����K�A7�X�0+&��pdqL��V� .!P�p�; 09 PVw(��׺�N��I���i� �7[��6�  on��  @��(Q&VȖ5� �PW9��6����L��vx�Y|��u (�p"O�&S� ����+,t��nEDT�Q�T7�RK�XNV�������w-`���u��V�;]�:�P c�4ެA  C��  �a0 \,�������}ibux@C� HI3&�d%9Mr�~�m��/<��"�/�/Y��Ȏ���@� �`�����]/$"   ��)7�K� @��2�qeT�"u'�1  i;�<�#Ð�s%� .���I�L�
CN�X�*��3�2n2,w������C�����<��k��m��-X�
6��<(�:Ɛ�X*G���J�,jiQ+�&� �v�l�^�!��wW&ec�:�a��7ϼ"���P8@  " �s `R����1��E�I �H�b	2��M{HR�.s6�M������=�����>��Y}`_	��	��e�&9d���  ]vR9��1���p-�Q���H��B\��̿-
C  ;��  �#$��hq����jf`/
ޡZ<�r��W��� ��}��~    c�����λ�;n������c�) ��.��=�$�rQ.�\a��
KX^�m�����?�eB¨��̴��6/�;��u���[O�:��  4�Ɛ�ܣ�|�b�1paa4���E�d�$6�� ��L�F���~W��^E*��5UV|���^�̌�]�ܩ�߫3�7���^��>@	&�����k����������
��.���' ���%�N�xsT�e���2�cm�9v���p �   8ܲ�@B��AB(f9�,��vc �\���Y��Aҽ.r���~w���㳀
=�����Z �A	꩏�OwpH�H�
%
K��%""]RXuWQ
�H'��F&���]&�R ���Y ��y�&#�1. IlJd1��I�"R����P��9 ��X.��h�0���E��Sɇ��N_�с@����'7�l��9�c��
Jԡ@��@��	�-K�B�	��.̟�q��l6���E���(j�k���I�Jk�B(AVH��,M�a`a*��x�bs�񦟜��Or���~�<,�����O���?���  �;RG�1v9~�(�C, � w�]q)Ja�;Q�w$�M��r�yN��\���/�Q�ѽK��7��N��" %6ң���*)fi"�B��Y� �`  P_L$H��7ƥ���2w}w�_h^��N_�T�~�~��� p���}�ާ��}�2>�G]�rx�#C- ���.��wQ 윖���R�RV�[O��9!d�)$h� �  @`�1`-K �0`SD�S� ,R4a�2a��m��7�9.�yd5=~�{Ӵ�=��~���c��~xM2��� ���>������]�9�s��a�Z�Ȯ�{Q_p�[Uj�(坲��ʚK����;���] 4 	 �P	�	@�t���H  Ihr�&��h�$\��DE3��k8��r�KU���a`�������^)O@q������>�>���ͺ�7�<r�_ ��  �V�HP�jY�V�%1d��tN)�NFI   �X"�D�K��fRzhl'4$ �k�؄�Pr"�/Z�y�{�{�.oc��שǯ5�Xw����^�??]���v�������>>ɇMdtv��w�/s�Kg��NJ�Dw�.�M֬�����b�
O�<�;_r׬mj�RHV����\ .A�pK�2 a�1� �����&�8r�%C1��K�u��m��/ξ��o�� �N���w�g���Xt��17l��X��X�Z�+!��-�5!Q��?G��+\	8�: @��@$�6� f"jbIф� �5�,�Y N �`�]<I]�3��֏�&�|����n_�������F�O��_�G��7�gB�h7��M�CwrFNneI�ZBj��$�^��[�`�,�r#]9�aZ��~�� ��� ��C$4fY"���p8�k9xc p�dD���D�6�θm��y d��e>^��}�@w#��!��7����-v���f���r8� à��,FX��
���bX�ưN�A�}S	-�s�X�K���   �*�R��,�G{�A��(�k�<�Q���U�0+��������_?\� �ݿ���8�w�����}|�OO1,�ɱq�Y˩gyC=��C����/K&�@@$ �F-�%!�� �,1l��+K^�H�^���eu9L�?�7���%��.�}����9��O���. �FG_��w�&�4ǉ�::c�4�bV�2�J!��*�,�E�V�2`C� D�� �8BcV�X8p! � �7n9�r8�e�`�[
Hsf���f�^!�N_�����r  � `t�|���i���×�7�2ǘaF2�ϑ�tq��v:�9�r�6��N�$: P�Y ,�� 4  ~�5��.��F��Z��s�Z�fj�a�F����';������[���>{���}�� �`��O�w�Y|��O_�������]�M���v����v2��<��m�
$��E?	C��8 oni��7#����l�{_y��q��Cw�4=�/������c��� ��Y���  H����_V>d�瓻8�X�e߾�?�,�ͤ�c��.�T�U��w���V۫z�MoUs@�z/7�!�H^$ @�a�@N����w)f�F���s��Ea�����U�̽�>��e{�	��'����w? �e{g�/�����̮�D�������s�d�ÆC�W3�^BaQKϠO0����^H"F�A X�`H�E�-  �،�+'je�j<��`��F���Ề�k��{��>?\o?>���Ӌ�?X�o/�K����v&<=�:D?���ݬ�3��������0/�������]}�U�	
�  �p"E    eh��I.C�-�xXH&��'���҂\�j)�!�i|���0�����������;�@z�����~�̵1���=�ò�(gU¨��3|Vo��B�z��)[h���.)�� /�x��uuBry?Z�I���U���� �G;���O�kУ?�� � p��[|o�|���:�,�e�W���*���W����0�ƫ��˂�j��ꡉ[+\B������ �C�H��da���������.�������ϟ ��?� _���v�̮��/6�����h�~
�` |�K��|}ҔZB�E�؅.�x�>!��>��������dt�Bh�%{����f��
�:ur�� ���U�k��x�?���ɣ�8zn�w;�C*�*F|<[��'E��pچ��x�I��K��b�B"ph/�'R�-:c �73n��C�����$��z9g�t�:R�Ի�I���O�Ƿ/;�� _)������l  �ގ��D������Nʥ
"����7�9E�%�+@��k���D �>��~�����`�@(9~��鯿}  �l  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cpdyjw4w5v58"
path="res://.godot/imported/Skull.png-f379d7f6066c52f0d53ceb433eaf024f.ctex"
metadata={
"vram_texture": false
}
 'T!SFz`5O�h�GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[ g %�ԖD�H��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://xa7eea6vv87b"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 [remap]

path="res://.godot/exported/133200997/export-e7de4a5fa3dad1fa22f4b34ade96ef28-addon_icon.scn"
:.q�̏��[remap]

path="res://.godot/exported/133200997/export-3f6dfedcd5ab4046d211567bf6df0470-DebugDrawDemoScene.scn"
[remap]

path="res://.godot/exported/133200997/export-ddb3131f8faccbc76d84042100d0a082-DebugDrawDemoSceneCS.scn"
���~�p�0��҅�[remap]

path="res://.godot/exported/133200997/export-67c7b68c84acef1ab54c2d40f3c07f4c-main_scene.scn"
����^�[remap]

path="res://.godot/exported/133200997/export-f93991d115d1eceffb5087fa5a56be35-Path_tileset.res"
�y�u�-mlist=Array[Dictionary]([])
JG�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
���e�d�p^ωPNG

   IHDR   �  (   �";0   	pHYs     �� ]IDATx���G�dYz�	>�\�ܸ�Gx��� U���鉒���,�Df�X�
��~0 -�{ԲW���6���ӅD�ePgƕ_v�,ιWU�<�{D$򈘘����ի���G������߬߬�K��/�7�7�\�1�߬��7����|��O~ٗ��i�_��KZ������?o����9�RH�0M�N�1X��&}x|�G*Ig���/��m�o���������W���RH)1�@%��l��'�� �����?������^�1��Y��,��~��/��C��$I�c��,��Z
�����-�?�� ��[���������~/C�-A	?��y�X7k�n�$�O�1mcZc*�[c6&�~����ビ���ʯ��)��Z߼_��~tyu�'��ki���	�N@8� <"��nj�u��������<�(¡����*t�1�죒��q�uCCS��MC]�X�뚺n���7=�w���{�����x�~e�o<�ֲ�tbL�0����]���Z�$�}�����O���X��	�.(k(q�y/9He������%@� ��+�8!qh�i��ojʪ��g,
�Mg8ﰍ���BUU�uMYW�\��ֽ��e�/gumH�fý�Q��7|g-Bh�܄�y�Z,~tv~� �$�p�s�-W��5�1�i��"s��<��Yn�n��{p�?��!�,'�y�����
��{Oc����Pچ����8���b6��e����'G�$�{�b���ܛ���4������V+��`z�)%I��kA�H���%�a�!Dx.�>_�3xv�Ȧ2+�����g��4x��	�H���=Y� =(�q><��a-x-�7��5��������`@"�N�����OԳ������w}�Y�_����dzy�'u���r�^��*��SU�����*!S�<���
��^�Di�w@4`A4vA�����~��`�@%�ֆ8�K<�����j�;@��D��:^jt|��:�wdR"2M=��2�������'���'��������d<;<<���ӷ����>�׿�ů���駟����9�4��9��g�A���*Ԧ�c8�����R
�/�/q�C���#wBn���!$����8C<$�������NS������~l��,j���z��ŋʲd�7�ѣwx��{�>����JN��y����Y��L	?�<�2)qʓ	�258��
�*� �A�qʷ��%!z_��!�����u.6��-�/QH�K�wkqBu�!=8/��`����f��\�(l��k��s���e���7�b���g�.��*��u��t�7���d��:^����Ӌ�����!O5y� ]�w��D����kp�$IH��ֆP�8���J�ๅ8$N&X���EC�����bo�C�Czp�b�A8�s>��n��N;�P��{L�PU���T
�����j�b����~����÷����_���ރ7뛉p�a]7m�����3�i��)b4�pB�2%��m�0���8zI/ g6O�%N�Y��@��^n�������^�PJ��L�@8�����V
��k��<���
!M��I�N�����zA�6���9��b�{�����|���?_��~��ŋ?��x�A/��<��'n/� �VL-\<�e0�6	t�$�����
�$R�wH���e��cv^�e�Ŷ7p6���u8�q�!�U����>N)ƻ�1�m���-��k�58g0ְ^��,�!����{���t4�K�@d�_��埧��r6�q9����9Ge	�a.e�%8�1�ξ�'U11�%�/o;�[*���:2$��GÏ�wˠ︗[���_,9n{�PB��m�J)��H�(������BQ��2<��c���<|/�_�F�??__�߬�?Z̯RW�,#M�z'P�
G�l����k��>��x���Ÿ��)��l/�R��g*u�Th_b���R�=��`�4^���4B(��(e��qyy�C���_,?���p4����ޟƿ�p�^n�bv��z�����d�s���|���e�/��Љ�$s�����y�w�ڰ ��3�.���xBͺ]/I~Qk��E��RHBm�Ʉ�bA���������ӏ?dUTϮ/y���~�;����o����������H�do8�ki��� �!����������  ���6�*bs�;ߖxC���	!C�-H��
��8�=wx�qn9�ۧ����{t�uK%�&�_�|�	�w~�Ȳ�4Ψ����:����:����%�,ŔӋ��I�Ӭ?��t�o��6�r>�y��._<��~�z��i���`��$M�_bއ���U�+^"��"����"H�;�O؅9�;���}W��t9�^ggݽF!����j���� !W�D�;�
�8`��;C�{� �r����X�V���6�1��`�ˇ�\��X�'��P�P-��z}�D�bk�y�T�Ul�ĵU+�[?o\[~�6~������C�Nnc����s]�D��������}AU�{�p�(_e9��ޠ�'�`�ɤ�}R6�k"nO�<�	X��TM����������n����Ui����v�����-^>��Ϫ�쏥-IhP��L����'@��:g���pb���}���:o��6)�*K���Y�4������F�j=��߅�|YL���n���2a�F�^�G�Z|l�����:��c1�����X�Y���(�4��]�ؓ�#�����[�<�?<�N���}~���k���ϟ��^,��^��fd*A	I"D��}� ��8�qB e�%�6�6li��ͤ|yH�b^(�[ƺ� J�x��Z�"��TѠ���V�F�/��C�!��i���.o]���7I�$�u
�^�#Iz�1�<�Ck��x��d�1UU������%eY�Z.YW5ʛ���ޏ�g?�K����g�Px(.?�W��8�<���h�PR�u�kӬ�.���ű�r;�_�7��wk���yfJ`��{�����	V9���T�h!�ڹ�Ɛ
	J��)<�/��Sg~���;?>���e��?����Kׯ��W��	�<L��D���%�z�L�e�,�M�zs\+(�*$g�M���s߲��..@��!s������K�����y�� :4�D*�[HG�Nz��F�Mc�v��Ob3�Ś�O��?�q�����|����Jx]�~�ZL����+bM�$I2�4C'
px��1�%��. ���Dv����_��i<	��ȷ�T!ܑ�R"��YNʭ�]�d�CYU��,Y/眿x�AU6Ӫ1����{��NBe�����|��韭�S�,a��3��t�m?{�:�o�Ůc�����ו�v�K!B
���X��N"���$P���8�ݘdZ�OJ���w�#_����X���ȵ�K�^֘��ݼ��q�#�{0�[�z��y���5�������6t)�����6����1�˚t0��������?~���_In��r�#-�e<�%(�iaL�N�I#���"�_;M|��A~�_��+$��;t8C����DH����xDJ\G���ށ´�c��3b�cݛ[��B\R֩Қ��9�RX[�'O��|
(V��s���4(�y��?��Y�M��`��.×_9����r6��|v�#��!�pd�#�!BGv}:�W����d�ͅ�j����1\)6]"�����>��]'S�@/Bb_��Cg�w�fN�=J��P�z��hů2�ZҽR��]���)��A�B8 ���^��%�z�����~�*}<�o�Ϳ����O��W����,�_�����7���5�4gC��w��vc&�}g�M�~��˅�����b�;h���,�B(w�����U^'i-�ozxw��*����#��������U�[_R��y�$RJ�Z�� �ԍ�(*ʢ����Lgj�0�����?{�v�SY��M�u��//��	�>D��O|Q�_,�<=�A�CkM"i��Z�5�]��[�밂�܆�n> w'��xWj#�;X��jo��_�6�:v�M
!P���"����9��o����^���a�����_�|��1��md?��Ǎ����4A��	��k�ʆ���X�q0ޛp��7y����w|�?�|�[5�_�����iVK���I%JJ����2f�?��@ÇD�����6/R���v^tЄ�[�ͭ��������]Xp������� Z)�-�l7_Hh[~�/|�P�+����Ґn�//��Df	�J�>?�w\ͦ�uI�����|�[���r����U���*�[�w4�W�$J#�@+��M$x��im�uN�]������ܡ�"����k�;�/��n��X.��_v_7��B
I���mT����O'�V�#�S���c�A��m��p���:�v�ο$�ߟ_]��b>%O�WIK�U�w���2��������o�����h�B
^9��z�mnc{�3����[�@�r�%�U�UYv�2M$p���Œ(�`0Ě��}�w�'��x$�T�&�����O��\^��\.0E�3kY�����]D�W�n� �������r��eX�D�J��^_V��hJ�*�.&vΆ*�u����|O!Qm��X^�$�������Y���ߪiu������[�Ļ/�i�A��Z|�oBX��~rrD�.X�K��Y�(��d��5��[�X/�ߟ__�IS,&�{��=�T"���+�����w@��ʀ	7�}'���,!D`A@�}�8+��K�W/�M"o3�����/?}a}��I�ֺ��BF'�ы�r�����'?�,˿��������o��B�U7���[�T.�����T+4�M<��7Uܫ}.;�W���P��^�e��J�.�vg}U��+_Kʮ����/!<R�P8���!�CX��!!Q��غb�X�CgɟK1K��xmO����n֫ŏV�韙՜��0M-uU"=h)2��'��W��eg�/��w�|,�ܭK��l���w����_u�}U�׆u]|��묰�%hM"^jD#��A8�e:�{����%4U���3���/�����������	�yy}�W��5���r�wxoѭ\_��m�Λ������_�ݿ���U�W��6Y�C�i�m�M|���
#�_�a[����;��;�[?���m�z�Z���J���u]�����Mi+$�%���C���4��8����Hkqu���8�u�4��Ӣ M�����'�{䫷���3��O���G���U���xC/Kb�P[E�N5��Z- �e__k��8�_D�ˌ��y~y�K�|�^�#i|�zG)}t>B��z��l*��dI�3���?{��_]_=���"�k����*�z��`������
�T�Z�� �#q��mn��Rt_���wi���7_������b�|�c�J�Mh�;�$,a���xG�edI���5O����ş���}�|办{���ES,I��J�OR!/��^����7��]2��2�/����^�Q��>x��/s�T#+v�6�{�$%I4MUqsu��ꆛ�W���z�W\�x�W��\�8OQހq2�d�{�:R�ߡ��<� �d�wZ�͓;<��wO�[�y�zB�㓷��-|��Yʻ����6��c���rkC�׾���w���	n+g%���2A��1�9*�:g1�F������'���qmO�a����@~��֢#bҘ�T�H�����#�x��_����d|�1��^E�M��-\�F�T8D{���9@}u��޲_��7]�s��u���|yr�].!�K�����^��P���xm�Jݙ^��Ǐx/p~����#������@��O�����<���C)�C�#׊L���L �z�%z�_h��E˘����M��Z���o�/	e��o�����k�t�ȁZ!u��"`����)�|��O���ϟ��Y^=����v��'�'�^F��%ր���m͛n�Z�����~����7Ծޫ����[__��p��x�`���_�qo/F�������Wm`CD!Ůf�f��R�'����'������/�>��z��F���(��ُ���'�*>ME&5�qў/B���k�:�ގ����n�;�@�7uV�b�����������߷�6R��U����)gr��_��%��z��n�9o:�����j��A��+����L�Oq�n$�Ͳۧ��T�pn�ĹV�� ��D��n�9��H������"�
��{�$I�1x0���sG��"�䊖y��-�_#T�V�����ޯ����{Ϳ��v��>�e����L��i�T�v��u)Z�x�^�k��MWk�;�K_k��`�;��E���a��w����w���e̮�5�����h����=����
B�C�qjUUu���si6h�W�T�^?A&���<y�9��8���{G��\޷c��O�5l�5"K�2�%���ӷ��
����o{�-#o�h���|���T���n�y�o�y���Gܭ��~����\�W]������}�. ���~���iY��륔���,@(���K��[2p;I����$R�d;�	�BU,���P�1r��r6_�y�x�[�n��D�� ��㾙��.3�[����]w>�ΰ[-�]��*,���æ�a���e�W���oo�HEQ t��a��d2ao2y��|s/���lS�?�e4�f!b\(�&�}͵]B�O�J�o����D��/J���H����|�=�:r��|x�5�;W|�H�rڙ�2�uI�ۥ�@ �pB_�ݩs�v}�ۭ����o�&��!6�`�E)��cLWw΅�"���ֺ���$ADqP!�x�/�t)e�[g�Z|Lc�:a<�e�ֳf~=�]�fn��|������ZXT����!�.�F�ы0���Yl��,'�����`�E�+������kcP���WX��\�ZC�*S��C:����w7��l�U�����	��= ��e�%I����Z��v�_���B���GiE�j�<���?���=������#dd�&p�E������Q�5q�I��J�j���j=�l=�-ߢ�D<��+�&ݖJV��c�x����������m3�vޏ�([���l�hB!�!7�R�N6�KHm�S*���C[c0�q�	ؾ���$��:�zZi�������dW���(n��8�`\�D&���{���Ν���)Iv���i�~���� ^�.�o7���m���W{��!�R�3����v]:�-��o˲�Ց��@ʨ~`�2�c�2��Ł]���6mBz�!����gY,g���������cp�A9����u o�)�o�@�x������;��s.�B���
��Y:�H���5��.iY��F��:���k�)az��-�n�oKh����Z�ew=B`����Z�v�X��B������:��`ib[_k�1kCBF1�6.UپA�Da��Z�~'|�Qt��9A��i�[�*L�cC�c��PE����u�Մkk�<Q���#��9އiO�0R`],1������t��~������}�o��� k��;������M'_��.����o��\#�D	�2��[�!�`|wIw�	)6��6cv/��5���n�fG��ˮ��n�����1�qt	����zn'�ޅ�"�`��+@�z�;ϝ$���-D��Q[�j�I�-�N!�#I���v��m�Eh�ǘ�y
�<ڻ���{���Lxpƴ�	^8GO�;��[b��V{��,Z}E���+"R1Z[w]���JNx��G|iy�[ޔv�uBRt�D��G�v��60�}�\�/ �X���U�q4�닶cWqj�v4��N���� �4Jɭkn9���QoB!�X:���[6��Z&��9�]#�B�@�>�:����u��|�����ʯz���o��.۽�D�zﯳ��k��uv�������ˮ�ٍ�	9�ؔC_si�n���-�Je/��֋{��4p�E��Ѓ�F�2P�\hۿ��F���6�-��iS2�-�Ɵp�C�ċ��o���e��-L۞F����̗-!��w��b���m�'`��{b��O��e���`w����+myN�w��7z���h�Tc���f�� �F�8\��A���J�\�;�i�h�l�෺���0����T����� @j�Ʀ8�����"���bL�������&�̝�h����h<�X8�QZcM��F#z���Ξ+5�o�[��i�RJ�2$G�m?���΄���/$2�w�m����>��q��]�W���Dw{c|]�qK&n7��3un��l� ������l6�f�a��x��輏�71�ح�K���yfb�\�$#<Z%XӀ�() �����ή������"�4�DX�suH�<8a��@��n���gtdW)���Ãt7����Q�7o�o�o�m@��
z|!��ο򄆝������>�mFѫ�~Ә�)��-�)����ϭ:���vsH)���c���h���Нz����Jd\���-�o���4!�IP*��E^RkU���Ra��c<ۭl��,<�n-[r�`7+�]�2���'��a6�*_x��l9������U�������v����ĭ��C�Dc�Rq�N�����v�-x�M�\�zn�v6�6�Vk�SJuֲ�-E��YP�C�)J�nx8ETt�F.�Ě�J���D ���֪ӛ켅��&m���=��޶D�@Nh�Cسm�
�k�;5�P�۬��L��l�i��1��Hv�D:V����C��N¸Mj�e-l�%�mH���Nln�ۉוڴ�۸v;IϽ�Nko뤴m��r>Lt�;l!J@�@��6T{no�4^�>އ^�8���7=�����C�h���GxO��8��:TTR��ϩ����gg�7~���-�	7�5�� �IY7���m�mO��֍�&^��h;l�|�Դ�ܙ�6��Ƽ��[��t}��"���[�����!��r��B�-��l�r����[��/��m���W�=Bl��ێ�X�5���7�u�ߘ@b������
k�_��k����o����#��T�����q�"L�E�n����*q�%���!������%W�j��5B�W]_'Li�c��s=�@:�f��K�ZP���y��/sI!�Lˀx/��i����Rm�D;�0��8��X��bF�^�*�[���1[Y�(*v���#ɴ�G�n����ГD��⮄D���"�wm࡚�
�Y��* �aG��&��Ӷ!��{�/���ݤ���ƒyy������w^�ZKcLwRw���u��:j�օa_-2���K13Q_[�P���Cc���j�"�3��1�~���J��O�9# �Lh�x!�3Յ���"�l}9Z�6���]��CKy�We�"\����m#�v�S)n�d����&���i-XK�e�zd{��+j��Y���}���#�*S���8���ی���ZU,�Ҏ8��7�� �ʲ������5EQP���Ҙ�����lq�IT��\�p{}�[��4�J�p���It�)@g)i���:͑:�T���V�64��L������h��h}�'�ݪ��A�"<<�E2�h
~���݉c�8<x��m����ˍ��%�64j�;�ŭ���~�B	Z|x�����1.@'E�!T7�����1��.�$1�5H%It��m$T<R����K�IY�c�AMV�r��r2���J|U��E>��Ú۵���}���bm���oP/��xk�Q���8:�1�k�<���'\|���9�6��x�2�4��܄=AI�v��j	�C�P�sH�"��x�~ߕ5�j���J��!U�DX���=�Lz�4�4����u\���Q[��$��u���9^���6WwԻV��#|D�݁-8꺦��i��#O�V��1l�����y{�&T��j�y��<����;8��w��΃��u�ⲽv e�SUU��i���<��ÿ�?�~Or2�KA�*�i0�:��'��X����a�_;J�ł ��nB��,t?C���RzG��l�]������_�I�^��MTZ� ��s���#ͳ<���}�(B5���.�وwnc��E@�+�M6v�PצK(��Q��vn�j�-�[Ą��\�:Y�ڐ�}��5���s��v��X���$I"WT�m�m�ᇖtBSU��Kp�r]�^�PZ�Ҁ׉FIŠߧ�k���Bb��wgj����.L󾰁���D�pC��8�t*�XO4(��!m�e�݁V�o��v/=�m���jȶq{�ﰾo�w�+��� B}�v����2Hv�H���-x��;X�MK9\�۔���j�}�'Vc��U��ℋ����-�\ѷ62�v�k��v�L�35B����1���a��RHY@Y��Qwދ�
��1D�Bt�n[�.&��Øۛ�eh�m<x`�J���EwЄ��� t�J�}��$:��ZP{_w�φX���E���_R�;'e����1��Z�2��Ѹ[c��{� 7��q��e��ۇΙ`lmgr����M�"6�/0����-އ�o���Aq�H�R�6�փ!P1T���U����>H�y'���k))A�@�j!��� /{������F���q�y���7�*����oK�*�w�uwzy�����������yN��i�Z��N`LC�刖����s��qׂo�K��&��J�Q�'�w��۫�~��wf�۝����zND/�E��E�W�쓪�B`�A+���^���UI[{Z��i���,i��"(�y�Ѐ�2�
��1!o)vm���!|����ҺKF�b�w�,�P2�����7tMY"�Bkյ�����{��+Hb���~=������i M��-$�[��d�\Ċ]ޏu��c=F�F�����^/�bv���X|��:!I2�����'��<cw+v6�����Y<�B]\��uw}�ݎ�[=JIx���~k�6��7�y4����]����V�$l<�adZ�޻�@Jy��Xg6ᅐ ]�B"�~{I���J�j�IW�;/ci�.�w3������Ak0���k��D
A/��I ch)��<�a6D�������Z��̰B?Q�` ��E�'i�ަ�^ױ%)�N_��Lߊ��PPl3;���7w�8_qշ�Љ�&�}Z��<;�Om9+��D硿��OG��.��$ 7;��P�x"�v�V�ms}�����ep��/Z��!�E�s��rC��v>��w�Z:�h��J�y��uM�� ����1��n0��x�qX��������N[
���$A�7#|/������Ѱ6�\LZ[!���ӆ4��+��o�p���e���C's`L�6�����;��[���Z��m�mݷm���A���wU�]LIKh���/���_�M�ۮ�{�QW�"��V8��8�r\MW��~���D	�����l	Zo�s[.47E�S�s���J��8�!����d��B̒D��iG6��E��DI�%����N8޻��M�����Y��-D1�C��۸�C��f��%�mY�vH�x�N[n3�¶�Q�%M:l�����s�?xۀ��A{϶����:,7D�B2�t�!��7DkB�tNZ��
]��y��(���d��mn�=�86�y��Xt�M���(B��^)��H!QB����i\�� �H�&k��\�p�[6A��z�$�3hk��5�ШR ���M��~_�4��	�R��m�n��
����c=���s���փ��֑�����?���cx{mg�0���/�rgY�����m��!���Bv����-|����C���l���U6��;|&��y��{�&�� �&�BN��`�{��J������&���S`7|iUm��e:IvX�Mc�* %M�9��������̦3���^�5˄~R�D�~�	@��`�H� ��c4�5]���!lFk^���Ci�N�?.L�um���jl[�j�8���^��$(�������c-Ywq��6���.ةmh�I�n+=4s�5�=S��'�>�_��h��!�6�eጱvGN���o���s��=�ά�U�<�I�pR�a����J��;iZ^fUU-Ib�������}�ŇrLӔx?���ng�Ġp>�ҷn�"oE�D<�Ա�1�uY�fR\��v���_��iNcT u�j-*�mB!�W?�w��E���_6Ab{��:ي����v-z�{tѓ�,�nN�c��vX�7��?��3�����"�5[kw$���F���cwьy/��c{��z^��]�??�Xzl��z>V��hD�x�{ߣ?�$M��|�E)E��1�l�����zDAl�����iJ�<	�䈈cۓI����r3kcqv��Y��M��Z�5�c�e�n��| �;����l�G���$��t�mA5�1�]vϲ kAPۥ�m�R7AB��>�m0����4��n���B
﷭�>h��'�y��1�V_�F�^����:���� w��o�m·M7�*���nm��l�@��A��eBPUU�����,��hL�z����M��6!��A��yO"5i�����*���'���?����upߕ����]2g1���:-Z� A��#��8�h-�J H&�oN[C�� t,�Yg��RWE'2�4�14[�n��ItB��n���^�ULHC͹��������՗�� ��1��~0m</�D+�G�M�G�����j�ckw7\0
ו
����s[��|�7��wY?>j�Xk7xn)�"(W�e�c�_���}O�5yޣ��ddU��ڑUns�E)I"�JCI�������*��j��"�t�FXdM�56t��AZ���Pxc�:�B�)�	i1��1��%�f�:D�:��dT�%�iX�z�z���I�4Զ.#It&�*�6��u��DD���Uq|��e���*�Ś��Q�N
A�$I����� kі���oO���4�d϶=�����x����
�C�M�Q�Jn�
ui�Ԏ�o;���.8-ц�-^��qY��ey��\,@�Rhj��kB�P�P�VZu���X��)��	 Aز��	sǭ�$�/#^y�[��I���!^^_�l�᙮q��������kp�Q�+f�9E����<I��$�4�A*PN!���J���n����W%�&�g�՚b�F�D\�վ��	Jm:��'o;��L���k���2�qo{����#[�3I͹�D��!$l��hN��d�m�H);�n�$�/�����PH)E/���{,W���(���r��-Uw�Ԁ��~��2p)Ĥ��0�>BH��%�����v�Q�!�����8��!�\�VX/�:A%:Xg��͸��b�XP�%�Պ��X��hvy�h��1�N��{���K�Zqss�j�`~=%��Cz���U�3�T�P��*j���p�Z�n4�`�����A�܉M�����Ia]�*��Il��IJ�hʲ����kw%��3�fc��\�u'T�ƻ��N��e!�p8�i���6����4�H�+Zk��ם2R�FW�=�R��1MCU�M���q�@��	�D��F��XC��N���S(I�����(��ND��`��P3R�uEAY��O���mߍG.v���ۡr��$B�����X�w���,jc9��f:����S���X��h/˒���N�h�t~tt�R�4�^Tq#TU���<I��z�i���>�ሺ�,zK�H�0��K�0A��ULڙ�Z���T
����\�GTѻ%iJ�ƶ[I�n'n��#P��u��`�6z��і��/�/tP�:Co����?�� M��_��(�H�)e4p�rYtᖐ��X�T������(`j���iL$`�]O�G��(EH�}�6Z�k��h�lD�x	×B��uc𭚭�Pv��[�u"&��uUt�%%e(⋄�j��t�?~�s�<y��}���y� ".�ZKY��DGO������ZU�:Ӏ��D�o+���''����2h�g4�3Ȳ� 9�V�<�Vk��we��������w�&�R��p�J)*��=�ېe��ՙ��;��W�4A���J�ڊ��j���,Y.�E�|�d�Z3_LY�פiJ���<\s��؉�e�Y+%��BB8��zT��������M�+�&���M]b��1M|_aJ�hC�Dc��5u{��"vq}|�]�I|�FO�o�����*)���H�� ��J�^__��g������|�9�~�1��,��zia��n6��U F�Em�QB��R���>{qƽ{�\\�pzr�����1���h@��g�^�'�\�X!�H�֐ڪ�3�S�#�6�	.<_Lp�
me_cɍ!�v<�uo/�wo���u��ع�9� ����r�|>g�^s~v�|>��2|��*�t�>y> ��X��mv��B)��d2����d���1��� ��\���"��"�c�عwBd�Æhj,A*#��ڼ�����/���K���ҹ0WRX5邁��˛��Tj���z:��?��������G��삛�i|����T��,j�5�AՄ�Ag�����&	I�p3[���z&����^�3��S��xp���{Ǽ��;�2�c(��M/�I� ���B<k-օ��i��#�:������R�ug\���^�����ok]�j�e�%pa35݈�C��PA�Ē�ZG�VUUUT[�Ħ��������y��s��ϣ�)�Vh��u��U���D�����g)��G�i���>���<x� n�����p�Tu���$�X��j;��^"#&���yN��i��/K�_/Ɍe!��������5Vh��*�@)�n�3������~��~����?��g/�X��Y�����4������Kjk��x!�
7_�ؐPT�5��c�c��K���3��8���7o�Z�ܻw��N����U(LӐ���$�E�RBgM��V��(���bAUUA�K�(�#cX��ĭ�����n�Hb��7^; �z���Ep8u�i�a�Xpqq��e�w����ǟ1��Y�J�LRh,"�y-���0��^t ���'K9�~����!��Ǽ��<|���=b�7a<�G4�����ex���GHA�7�0u�Œ�;����+j�8Q�4-����D��
�!3�7"�!�8®i��`�.y��	�����~������,�1����[ohZ��R����i���Jk��I����.���d�X0�NY.����Q�k����lh�b�����޺���5'�G�;>a��iNB������!�ɥ�5溮�M�S�K���,�nCk�����Fo������
�a�����/2��=!���
c�e�|>��*�=Ɠ'�y����/x�����`,
�A�S*�pq��Hoh�����v4.�Z�(H�9��H���������>��)�=~��Gx���{��ɳ>����$�.!O���pi;ȱwr�\0�W�츄�hh��8T�� c�64� A��GHf/� s�"���%?������G�?{���}��>�9ʲ�1��,(��7<���=���)o��$M�1^luD,�:%����ٳgL�S?}�ӧOy���b�bURU\�̸�������y������@��������i�5�8���bU�c��uh��a"�������n�4T,t<5�*�/�u�j��*��)��3^��������Ox��gg�u@y�Yo��_�S�J:8m�,�bE�4�eA]�n�Io�����YǓ����'O�������}�|�>���wX�m�_������\�s�qޢ�7��n=�H�����rk	�w��'�i8rV����v��2�)��g/�y��O?��O?����+�ޘ��q�Ѩ����ɲ�ý}��8��o?��Gos�������F��XB5"TC��>�WW<������>f�X�ɧ�����|�ɧ\__rS,�eYR�J�Jz|pBQ�ZpttD]7!	u��\	�bC]U��s��Ϲ���V@����^�V!���ޛ�q�e[���q!I76����J8��Q�`���{'h������t��g|��1g/.x��)773���{]Ej���ÃC���L��ZQ�ʛ����ʲd�Z�^\^^�0l]܈$:hŘ�r}5�����w.�p���'l��a��ңe�q1uM]�q�IN"� e�/֠�fӷK��x\Q�������d��3y����ܔ��哿X]=��!E-uS�'��1`Ve�,�:�vGL������������裏���c[AY��MZ�`8������x��w���C��o���~�~�02tj3rH�a<�����{o<�����S�߻����|�1O�<�*K.�gxc�g=ƃ!��OB]�!>.�;��y��`�I�b�ryu�g�}���Y���o2ٛ���G���E�.�2�5��l���kY�<�aT�p]U��rd�x�Z$gY�K>��1O����O��g�3��iK������޿Ͻ��N�3ޛ0�"N&�m�i��9�����k��9�?{���e�4�W(!�����h3ch���9����v�SuY���L&#�u��:��V��:��;XA(��&jEOqE����x������G��W�/��gϟc��I�Q&�$,�
�@AL���.�n�$����~�?�������}P��!��^�`4�����_��o������a�����U`m(�	�L#��*�u��!���q#��b�Z���G�?����1�Ʉ��ϋ��9?���jI?�h0`o2����}$����V�L�3�T��[�P�]��̦3���:�4eoo���S��1�՚��o�hhL�s�uQt���d�4ۣ[)��낑8�t!D���0�-x��}��?��Ϟ<����x��x��-�?�����.''a��4eoo�`4�`�Y��
������x��)������Y��-�x1ĺc<�^��E顗%��b4���KGc���l��0�ȕ$ba %� ���]��Z��-���_���u��r6E+�P��>x�m*�J���!�&�U7Ɛ�[ѳٌ�Ϟqvv�t:��*�^��)���e���pțo�����?���������曤I�y ��]�Cw/˓��oE��(_!�999AI�h4DG&�x8�����|>��c<�sr�y��AT��E�ӧ5��<TK������������S�&����*ՔE�ŗ�	�}���盎bK�5&b�����6���})���������9�?}�?}�17�%:My���x��wx����ᣇ�1���I���,��Z���T2a00�(��ӣ�4;8<d0����x��i���|'Ӧӄ��I���zƇ?��^�1����<K�9W�eQ�n�:$�eA�����q0�#)�ZW�%M@y��d��o��(V��,�R��@nh����(V��c�W���f��f���5���X/�%	*B"����7�����=�����ޛopxtD��c�&&e��]aSKeJ�t��y�=�1A��yT�9�wJ�eC�����Y����ϯ��ǏY-f�r|x�[�$�!V�5�bE�V�-EY!$�YBp��{��o� �`�ِؐe�Z��Ԥ:aثyQ�1��h���������c����xk0UI�Z�X,BS���,+����O?{��?���7\�,9<>�����?��~�~������o���I�48�؂�w4l*�A.g�Z�������N���[o���#~�ۿ�����g���/|���L�S�Œ�`��
�MSa��ŋd�fo<b22�Ǥ>��~dI�|>��UN�ӌD��4���P�B�.K�!EYv*�d�Jx�wݗ$4d�b.�B�*\�qU�j�������k��%�	�$ԃ�F89==����!�~�=�x���������5�q���D�,�v
VGB�Z!>��MMS��sV��ٔu	�rƇ~���	GG����LtA�i,������,�.y�X:�P.@W��x;����$�{{�i�z���2۳+�1��*�XM	���?}����#������S.�+���}�y��w���o��o����	R�����U�7��<�q����������yL��� ,�\2���%�Y(��C�$�ʰZ��>��袴D �H%�>�
(Tb��������E/c�U�n�lu������N�z�b�W�W�#t4��5ƅ��`�����o���o���;8@g8�j�"K��#�NYMn��0'9�����q~�Е'��ܻw�����c�7׼x�����g|��G���>�{dI�T�Z��P7[�4q<��qТ�e��e8���چu��[�_*|xU��IZA��]�eU��]��>�g��O���?a:[1���.������}�����ް��>@L��9�}{�@S�I�� C&�����������OQx�9;{A]6�!N�4���K��:pܠ���	I��cm��5�+�k6D�ֱiAY`��)%I�x�M;��#���� L5�6T���b�Xsuy�b�¹ ��H�9&{#N����~�w����߱w�O�� �fp{N��>&6o;����1�����+6�Z�=�q���m�1s�<Nݔ��p3��ѧ�p��	�|��h� zr��u��&�����6H=�U!t��m���j��R*ֽ�sAB�V��Q�%�咦i(b�)MR�����g/��������O��Y"�w��>��;?��?�!�>���8*�U�lK�6B0 ��'�ϸ��<�V��!�d0qxxR�X.�ZQk�^�E~��0�,@u�e>�q}}����h�<Wɮ�`ͦ�&�/;�Z�͎DI���j.�d4�\]1�ʺ@f9"I�p��\G|ɑ�XV���l�r�d�\D�`�Z�BW����������=&{�0�K�j��h���de��)և�����lY.�
�y��\$2��2L��h�	��{�Ǭ��.��+�r��=&�2ʢ����'ϟ����F���>C�	xe�I�C��y���&�8�,��E��)#�$M�����\]P�k �m(�U�쑣
�tVU�������o����ۿ��f�`����w��~��o��eA�DJ���,��Ď�"��Dl�X��^���p�wBJ-ܩ7�#=��{��4���lm8;� KB�8�L���P.,��0�R�DQ$iNc�z�NS�Ƒ���H�R�PTUCc-�{&�1���5�&0ӝ $i��A���=�N��@cB�x�X�ޝc�XakG��$���t������xp�w�}�����S�Cl�K��A@�YKc=�5'i��y�lq�Az��֨$�X�����n��2u||�[o����X��E��	����|�d��mx%��D����n��ͱނ��N��Q��܄2�b�z��X�V�"ٔ�BH�J���͌�O�����8i�ptx�{���o�ý{��w|#2���tG�zXM�H^�K��'U��F��l�a��@�����ئ�ӏ>����rs�M�膦���D�&i5nQ�-);ͳ	��&�Yl���^6�&�QDJo0A�tN:�T
B�D
B�8����`k-���<�G���{��{����Qh�nӴ��8PBQ��ue(���j�q�w���yFYV���^��R l��y�QK�N�'�<z���ϟQ/cm�r�����p��p�$�F#� ��&��H�l���=��68gB�iBIKJ�|>g��Q�%uSE]l�� �нki}��b��..�X��`<���~�;�������=���T#uLl�;�0Ԉ`|�:�xg����Q�"�q� 2g�v����������>������ZLw}�l�b���k�dhKӔ4+1V�d �佴�vBP�:�H�KF����{9+K�8�oVg=|����Y����4]���	�4���A�x<��r�z�-�y�i�Y>L'$��P�U������c�ޜM�⣧3��{9��$����7Cx�MC���޽�<z�68�r��,�h�0��Y�)���jH�jh�y�n�f��\*'5�o�#��54M��L�9|���)���9���z:���$�1���C�y�m����q��}����Z+��qo@`�x>n 8	��/u�T�� Ё)B*��>$�0!���>{{{���{\��SU���I�^I�������US�.wD��Ћ����A�I�jݿ���W���
�8��C�X���,Ӂv%!I�P>$TV�%��
k���X_���L&8�B˼���%H�1��v5�ڲX���s4&4��D��ڊ��TŜU`��d�n=�;RoB��!��HS�x2$�3�^���+�Եe�,X����0wHI���1��O�.0��{�l~�d2	��d��*OY:��5.ΓY�7EQ0��hj�p0b<ac�4��L�k�b��,*f�E�Ȟ����[x�(Ը�{��ȇ�Mhz24� ���r]#tFUlKmB|�	f+o!�Ҍ~�"��>L�t�`h�"��=|�ŋ3>��T��*׬�+��C�f���ޓ$	���L����ޅƚ��P���.0(:�ZK�;'�jBVk���:΁��md÷p���	�TS]]�<������srzҽN�[��z�=��dU¢0�JG�8��T�S4���q^�O2��4N2[�Y/��%��r���ÀT��JDd��!�N&��1y����0]�9\X�#:6z$��,�%E��UUuB��m䜥(V;�7�����stt��>NO��MHVEB��!/��y�stt���a`3Ŝ@D�R���ڹ�@��lj�U�z^QOm�0Q!n�v$a���K�
ƣ>{�i`��{<)=�;���y������G��4x뢤X$�@9�����!���f�yi�����@�.��\�i�S�\Ί�����|ܹ*�-R@HZ�0wq*��$�p��iǝd�@�r4����	j�-4Rb�Ge�����%�kǪ�����2�Ʋ(+f�%�"���A�L���G���UU3���Q�2�i�P�"��5�y2��(%Yv�D�88����ݝQ�٢���k��d5��Hظ�-�[������z�r����t8rxx Zu�J�pΑi�uPVM�Y�
V�%B�8�������d��D%I �G��"( {Im,��b�Z�*���b���+�5MU�"�^�ð����|T[v磆�h��{op|����)�Ў_
Ϡ�G�k�/���3tf�k�rV4�A�T;�؅Bi'�=����ޚA�c����h���|�b����i��yV���0Ĭ^u\�L$Tα^�����U�i,����d6��\�88>BZ�J�z��$W��딋�)���������k:U R���vY���%��y���E<����iꚦ�H���9E�����C�Z�Ji����)$&�tUU1�3,M$b7��QY�$Y�����7T%��T�����%CcUmX�5�g 2��}$Z�J�wX[Q55҃�o�^��"�X)X�V�����!ǧ�Y��8N��.��)�"��׫5�UkZ-Wa�p��@�/�%��H��~s�_s���J��q��$�A��͐���UP�yh8A�j����� �:���x���?
��Ȑ��;X�W��s����T���0c�6��/X�]0��g�9��C��>�)�\_��%�I���f�aYVQ����]L��2�y���WIJUz��ϙͦԱ�X,(ʂ��B,z;HI��uN�R��v\IoJ%�1�'�`Ч��a�e8c��,K��4ΆiIBQ�Lo�\]_1�/
o�@)�?<D�i܀-#^l�0�Q7���\�̘�*���BwS8O�XR%�O�\��.(�um)*���7��1�ǰ+���?����{{����o�e�^u�i�����e�=���^o�VA�s�#�H(��c�
]��r�E��h�W1��`��~����'4��^2M��V30���'u�sE�D�<���`Ƞ���$'��(_�ԶVlc�1γw"4N�՚r1g=�a}}C9�dquA����F�r"%�VeC�{2#pI��}�#w�������n^�U�k[�� F��*�"|5M���1yے�mT�2M���A)�l6e�ZF��f4tb;h�4!$i����:��d,�m���������R5�"�z�Ega�ZҔ���^�X��IҔ�(�C��$J�h�@C.�L�
���x�I�a�R��Im��\$4;�&-�W�ML�w������Sٖ�h?�W2�����d|�g/>��_aJ�����@$I��e�:�̦���r�E��sF��|*�_�9r|0k1�Źm�|1evs���9���3\]d��L��'�a���]�՚�i�����DÖ�ӄx�j�,���9�� B���(���P�R�\��2�[+��/~%:�{m�e�\u�$M���u]�\���`�Y��b��)Q����p�umY�ǣ�3q՚��3�=���%���,�6ﱬj��4��4u $�ƒ�2N��>0襔h��ѨK�+y p�D�ͭ�JV��[:����� �s������kq2u�ͨd������ ~����[	4%U7s�UXM�4x���dPX6�[�ã������՜�슛�E`���8�z�B8�a���+j��b���e�$,݉�:�qa�u�����z�T�Sx2Q��	@0��A�^�{\��u-����
���;���ucZg(�*�=tJ�.k�&]����(�k�^�X.X,JJGE��Ŋ�͜ǟ��~�����~��� ��*�Ƥ�N�X!�k$A�����TaO?O��0,�-v�x�ЉFG����V�:�E\;t�uz)�'��뒎��4M(���DgA�8hV���,���"�I����¶�[y���z'�����4�{������\�Z��R��lg�W����4��"[E��AaCW,K�Q�&��	H[]���H���p�`0&K<e1�6Ū(�Β�9�ɘ�hl�ơ{QxM ^���ZhY�4�EI��!42$QiJ%ن��=M��~3�@�@����D��al�b����yi�R�L��E�g������?��j���������}��V����y��E�<��[�p���7�U �{�AG]p�uSSUM�
èmo��6��7�vSDz[�;��u�\"���<r �&�F91�0���]�&N��8"0 ��uA�.:����5���hi��~���:K���DG�^�m1�5[E,O��.�}�K6��pXj�XEvIc-�A��P*���"b�u��H����`�$�.����@+�)�|��D
Rw�.����������F:�Y�u[��2��n��)��$)k�^�sqq���ӛ�K��b.=�:� 	����A�G���VS����&�Đ�,�0�o����4/��������,]+W���D��h�M䦞�;e4��`k��lU�eQ��M��h��*v�4*KI�9����0MY�����6�K	QM���>�$QXU����x���Q�773���t4@�=T/C�/���J�%i���zOp�&+m��(
���z/0���X
�i·!�J+t/G�2z�>R�P���̀b�R��TB]���^�X4$��X���wpA�c]�!Y5��QT1�l�:N���-Y��kZ����zEQ����LEU�Y'P���1u	���Rk��&Q�<�	��[�b,]�.JꦎĄ�E����iL�1��k��s�5a���U`?	%y�舷=�_��gxmw듐��P�wp)���-�|�Y\[��(���KL]�M���AJ��%,���K�Jptx�����h��cd�A�"TB�qk����R�ڠ�Wcm�i��к���[�UI�Cb��D��7���,Ѥ:�G<�1��41�I��u!w�G�$�x����'G���خ&���X��
퓘D�a'�1�̶�J֕AAV�V{���U�F���1�y4��*֐����Ԟ21ѓ�[׆Lz���+F��6�
^�Fm�XE'�u���(���2�Dџ��/�{��_�5�y?k�)�ض]E�&g%#cD�r`H&{�>BG@{�PU�������A/t;��֐d��9z|����2BPɰ?���}��?"��\�Te�d��0��C��X6C��EA�<�4x[!��)KL����c.//C�y�f<�����wz�^?�9C�$�M��)��1I�S�5��b]�LK[S�Q5��a;���=�;�7Ԯ�**0��)�kM$߆�R&�{}�q]�;��n�:�`9��ƒ�UHT�GkES[<h���x��i����J���a��ߣX��"jC�&P7��@iAU4�k�^��l�d8W��[�0FR׆��`�Z�Zi��`�b�`9
,����0�C�M_��Q�0��)��:�;�FeI��H�}���A������&<����H j[��[��.R�S�L��e�!c�jz}��悛�K�&��G�NBS#�GKO� �>��x?M8��G�9Z��N��f8�3���k�T�IO�$Y
JX��HL��u2yle(���b���5�U dYƽ�#�&#%p�`L��Tk��4E��͔��K���kt��ˆdY�Te�V��I��*���^/Y��*��ƝF�r���<��a�Z#E�<�u��.X.�,�K���Q<AV^�"(	�z=F>A�T+R�����_S�kz�$�zi�d����+C��D�0V8�w5��Q:�D���1�uU2�-���@��)u8�e��稛�+����^�U7�&HU��O�C�����܋0���i���;�zE*�JSI���k�\�X�x�Bs��gg/8�?"I�؅�o��+���^��N�rx<eU�"������P������	L(%�iMOK����x��8�Ͳ\,�������<��|�F�o�󈓓#�<T���Hj(˒g/������G�r5��\��y��hD/�c�'�cj������=��e%�X����i�%�J�0��ڭ�U
����f�\r}}���%ZKƓ!�6ᄰ6�iъD
zI��x��yQ�Z�\8Ky��=lS�Y�ɳ��=�{��O�G�:����LAS���P�Ex��r3�rqq�������}���!�-��;�5�"@��LI��L`8��Պ�\S7�s���/����mj���
�L�2���+0�%��Qm�R�Z�B���NNO����� .k.�t��dHr#��{(V3�H@j������|��o>��,�e��Aʚ �#LAE�bz���/�>gv}C�Z!<����O����A�m0衄�������?��׿���o����H�FL&z�!ϟ�����ߟ�7�o��?�8�:IBsD�n�PK�~3GSE!�[c�,�.i�F���5��S��z4�a�R$��|��t�q.���J@�zi�T�!������Z��q�d�Aq��	�AUVئ�������PLhj$����0\I������;Mǖ��v6۩M]c��z�_�zp���"(놤��<ua=*�3ʥ�)V,n��+��RJ�'#��!�圪Xsqq��'��h�#��� %���"�:AKA�U�c9�RVFD���d%�(�Y�
A�,Zyl]am�w4�)�M�o,�錪(�]^������q�2�e�����zXS�4��d�Ϲ����O>��?���O<��ƁNs��Y�5�U�>���`9�s���_�ģ��!�M�YT��pf�Ri'xd�{�ʲ�D�B�1g/x��'Ǉ�%�<�XDPM��Uڔ�h�0Q�!KҰiE�j�&j�����<�*�����<��ԗHoф�{�J.�k�|���r��kG�Z�pi�x8��𨓓�&�6�eAG�4MC�gazG�`fY�L)d�b--���_���c�#��z�j����+\Uc�:�*�!nKS�!�Ʉ���b�j����ӓ+>��d���q�p���u8���umq�����3�M�7��	M��"eL�o�����1T��jn�T�'c����p�� GKA?M�8�[/..xq~�b���u�,1����F��u�ًs>���P���&�����r˹ �B� ����T��DB�.���9O�>e2���5:IHt� �'A*O*��N�fU7ކ�M�Ja��Xf�d����H�$�Z�R������ ��9EU7�x$���y`1yߕ=�<g41�[�K��k�B��rz�0)P��o����n���zm��x�N��{\USUQbʒj]S%�1�:��d2�,������>���hB��8������PWa���,2��QJQU�ְ�$"LzPxlRyQ��9��jI�ZQ�
��9WW7�����do>���w�}Ľ{'�'C�w������Ǐs~~�jUb�E�8�Qi�J���N�{9�圦i���89=��􈽽=�O��h"���̚<�ٛL�L&��$�c�}����x��9����'`m*M2�i�`�CJϲ�)����h��D�J�C�D�%�$�ߕ�(��ҡ0H�И�E�p�⌋��^��~�C��DkF����IӔ�4A�7��C��C)E�������OC�+�;ce�a������'��ېИ���!N
�Q�b���Z+��1��[��/8z�4��"&����	Ԛ$���By.��x�[��O+�RR^F��P>$AE��\��sV낧O�2�F�����F��?���	�� ����eSsu}����7Lof1y
�b�n�T �b����j����j��g�����]���U�zْBt������wG}��� c,��W�Àf�D��09�����5dJ���r�����4��`����#�PR�{r<0J�7���trck�_\ryv�b6��*���R�|l0u �v*[���4�D�$	ӫ����t�S�w`-ֵ�� �|mo�n�&F�^��X�
L�>��d�ZG��gX>O�Y�#�k>H+��G�$��t���D�b�:HH�9��pmM$�H�y��c*��q���M.�r�����+�hzqyEQ5ܿw��p@o0�����rt��K�b�����/.���'<?���z�0��%>��A/��xv�(j�9??����ݻ�����C��&���q�*#���]i�rrz�;��rxC��ަ�*��%�ϟ�餛#������=�u���H"�%��,4���n���D�`QN�3H��CJ�� 1[Sk�X..�Ι^_���p�A!��҄4M8؟����p2�?
|��Ed�uh��GSVT���z֍�RQ�%�hH�^㬥(�;���n�]���l�It��}@�ť�F
��JJA��v�,�"����./�Q}��������!'''�y�Q���2!&'*�7$��ZOS���i*�mh\����T75\�6]�w�L������y�������@8��U���O����O>y��&�a&:C��]��D��4I�L�2���r-��g�<y�w�y�,����I8��n�I;gSk����~��{��VW{��i�$T%��(�888`��p����(�|����X�IE�J6Cf=�y��4��#w���`��8�}�X����<}v���%e�t��zG��1��zdYBe6��ƥU ��s���%�h��~)�Śb]`�)�~�ܟ��tl� u��
�n
���gL�N���t�xY���eQ#Ś�O��Z\��0>��;:<B'����'	C��c�ƄL<4c,&ʨlC4������2��}���cNNN�?����ܿw��ވ� t/%a
�j���⊏?��'O^0�-0���$i��kI�'��P�U�K����1_�9??g8pzr�a82���fA�,�&I"|6p/ONN��ː74Aʙ �Z.�Q\3������"r����R�$��j[W��G���#�ce��j�6kHi�rQ�����<��zM�N���x<�`o�x2d4쓧	��Ԟ�c�\'��^U�Ŝ�rImB��,�ܚ���@�z߂�{?�N~�V��$�18�V��A����L��;��pHQ�\\�q��b6����s�Ŋ�K��98�c02�-K�������
����:�&����xeC�.�@0�FL&���qrr�x����>�a�$Q����"��4�V��w~~ى�X� �޸�A�*����z}�dI�)T9¨H���5�kͻ�����q0�,�X�W�QU��G�T 8�q�>i���y��)��M��h���r��"L���;`0���1ց�RvJa��&Mc�:�����4MH�A8St����)�ל��`v3���r�
9��$Z��A/c4�3�e�yJ�阫l�(�j�"���ژ�D�ʦ1T14��]s~ub0�9Y�Ϡ?�<�H\c0t�2Ԛ�Ԣӄ4�����9;{A1�1��8:=	F;ȩʆ{��g�̖7�ɑ&���e���g�;=�{�{��x���!�A�|V�e	Bx���[�i֘�렶�2�k2���&������م�#�!�{֫e8yL`������鬛t�.K��@S�Ed@�B���ϙ/����AT���O?������y!f��%��:L"V	�y�ݻ���=�%o��&7WW�pv���+�p��7\]�spx�t6���<z��,K��_2���w8gh*��qA� ,Geטz7��*�Ȓo�x~4(Kn.�ئ&K5�(�U��b���;��HT�Te �gI�D��
:�!I�LLK�TH��f=n�_#Dq�T@&i�ұt�!�u,|�d�,!��B��y�,[���"�:���O�j�5��"H�ܬ��W,�K�.C,7�L}>������	Z'��.^.��nJ1���D�T'!$9<b8qtrL��A��{��9�Ej��(	����;�iE~�-X_��8l)Y�nt���{��� )5u<���5�������^��Xu��4dޓf*�A��F����Z�x���A��l?LK����+�?{���Ŝ�|������~�p8�E��fR��频��K�w���X��Xy*����\\\1��
L�~���hI�$��4�R�,a��L��K|��eY(H�C�am�vU�58GS���Ȇ�:��j�ӎ���!J����b���D(�Bb�xaɆMEUOPBR���"0�$IH���G�΢֠���t�P�p~��f����� ��Ɉ^?�p���#�'ܻw�4��Y�v�$���$	�LiG�I��e!dyy�@�C9S����qh���u�t>��E �E��î&��~?R�,���Uc�U��� �6���C���������y�!JB�%ᤚ'��%�t�h�(��7$J���O�%�㔳�3�x�O�<��?��O?���?��.�� ��p���a���2��I�w:�7A�i�kC�8�5ӛ�����y��Y�4�s��4�^�|�9�Rbqf�`�:�n1��{,��
�MwMA8�ZSu<�PZ�.��ÿ����4�StjC�� ��HfaJp�^	�<�?t��jD6���2�-�^���(�G���kz�^�>Y6877%�eI��X�V����~��u�|�{�����D��	��G�F³N�io��6��pu��UR`L���4ŻM�Ӑ����k4�fE��h��q�jt��ժ���4��w.W+n����Lᝀ�ItB�id�����u�M��R`L����ߛLhL���!B�؝-������ "���En撣�CRfʷSŬkh("��,���j���5��4Tk�i�-$�@'�T+�,����B��Nʂ�41?2Ƣ��W�l��^
jK͍��+%�5貎���^_��}}�����?�/�K�M-R@�� �Pi��c�'��� ���ʰ%��|�
��6ܸA?!�i�=8"j�u:�E�G��UA�ߣ�ptt��������������}NNNB0��:/^�%HA������X����L���.��|gc2�&(�jUS���3��B(�d8`�7
ə�1���Ҍ7�����c�74eE�Z�yY ���4�\�n�4u�Lb�`Y,f����Y/��<REj\%������o��'�'�|������nt�t���ꆏ�'�d�h8����g8Ro�y0M�k��j��e���>�[F��q���y.�e�~�F!Q�CDي�b���1�uEJ"���,E9CY�\M�X�
���i��L�$Ih:h567Snnf;6����Ol�LL�| |�^�����0$(��R&Ỏ��V�xHc-:�XLg�Lo0U�T�$���1�J�{}���?RW&L_�ʶ����$L����7�<�7�3��?<3�(7�	ֵsaBK��8,��)V�bEcb��}P��U�F�B�P��77Q hJ~��[�&��ڈ�K�42���nu�s[ø�ȵ���P���ꊣ�ðQ�}z��/��ț��oZ�Dم|Y���{A�a0�srr���%�|�1���駟ps3e:�2��PRm���=�����q�XD�)�i��٢�b��O��{N�{%³Nmk�yJ���.br:��2�����ڄƼ�L'&�^���s�5B�3	�!������)Q�N
�W��Q��c!��,gsW+�2Ԇu��K��9ޙ/�Ȩ+Y,V�z=���G��1�dSxD�XU�i�;ꦢ���D*R�鱆�X�^/1��VB��L´��l�$�jjV�5��ל_^A�"��4��
�Tu9@ҕ���W`F��4:	2xMS�X,��n�p�ɐ~/��˘*�--�⚲,9�H��(A���EʰR)�N8::
C`G{�p|z���K��E��/���3��.J3�KG#�>�8j��L���{������@9$��i�־�;��}t��AG
�Ɛ�r�b��u2�HtM��$:C�K�Ui���ǯn��x&�y�$I6���Jx�q��w�f�I�HT��J)���u�I�D�fM�W�~	Z�J%$I�1%C}v8`m��n��i�3��2j�(ɺZ3��(�k�T�Z��"OUl 5�u�H�8�HĊ�Ij�~�邫�+��yx*�i��	*^s�k��t�Y�x��T�Z���c��:�m��9�Ŕ^?GƊK���/��Hk[��(������2�4QxkӐ$I��yx�o�����d:�ruu����}��|�	eY2��c-� ���%���y/���8<������1�[�opQ��IP- ���7U��HM� 
��0��:>>���h�)e��E�e8��	ٯ��}1���Co����I��۴�B8��4��xp��r#)����V�#��x�^'j��� ����PQX(�X΄��T��:�����eY�Z��Ja��X�0�%釚� ���bMSUH!Ä4�S�����
c-�Œ�|�:�1IӔ$Q=����Y�mYv����[�nOw�]Ff$3�J&)QY�`�JZ��"T`��.��0�",?�
%�/2�F~�)���*�$eB%Hd�f�$�L*�e7�=��W?;?���>7"2�m$���{#2�}��k�1����g!�V�����4���������1.�^�P�Iv�V�78�/1�L�U��(PV%ʪD�k�v\Ê�ːt̐$�(&f��j��gg'��a�X�9�����+l7[\]�b9_�tq�Cy�f�=��uӽ)��@�e�~���L\c�����%��M�`2;A�g����!�L%$�R�`.�@��(�<������l�5=��B�fx��5$�,֊���x���y�k�_���tF�#%\.]Gw�(D.��������`�����{:��#.�5d]2�F�'��Ӕe�4�c{k�|+O�jƩ_�-����v�L]�������C�w��MܮnѴ|��eH&�q���y��y7��i�$Õx�R
M�b��a�����dS�B����5*6�Xס�k�IF�nA������lW�p,�,Kqqq�����o���eY��v��*�Y����t#��{HN�:��'����qXC�z��]�$	�(����$	�P�M�S�i��l�8���Ka�`C�14�:�����t�cyz����'p��c�=x������;7�m����_5]w�Xr?T ��{�z���� 催h�9%���� N�ARP^�?�y��n���I�avU�=����
V��H�����`w -���㽽��h:��v�w�}��
mێ�$I��� ��[�6qƍ����:,�}�C�z���ggg����˔�_R@81b���B��k����&��D$F6 @G�y��j��
��<}�U�b�^�lr#��4-��m�Ȳ�i�p�7I1�b�KD�
��E�RBq�|EDO����Bi�$	\ �;�U~�O���-����?�_=y�����O_�~���������P~��-$gHӘ���#h�G�\X���s�����w�(��pz\�Gl��c�ǘ��C�g���5Mۢ��W7�� I"��g ٬@o 4tH��b��4R	���k%�^\��K�,w��TɲBTBPH�=ޠ�[ep�p�a�7��(ЉJ�j����y�ũ����p(��юҁEc��)���"������B>�`:���Ƀs1j��uTN�h
lYU0Z�	�v�cz)�g9�-I�����,-ּȐ�	! փ:s֒�S�qE0Ƅق�qk9�W+Z�'\��~���۫��_=�W(�˓%�8��f\���53� ��8�I��,���	�<:��[9 � �_������e H&����(������s\]^�:�P��H�W�`���:?c)8ㄓ���D*Xk e���)���b������-n������98d@�eY��vtɐn�h:+�?$h��;$Q�4����di��(��p8��(I�&��^g��)��&�H6�6�x�)�
M]��=yL�| .�H*��8tߏ��,Oi�$�vΡ/���7�/9;��%6�R)�Y`GMP���`<���2 �����Q���Z�@�RJ��Sp���Tm��G��\����v�����I!/R$JR=��v���?���L����o���>x���e /w��NJZ�b�������c'fȣhL Дv��.�سY��<��w��0�V$?����$	�,EߑR���v�ʲ�s�)sH�IJ�����<��ֳ��R_oEP��7"���4����T��r܉�;�%C>lT���Y��f�=��r��3��S%ϳ����u��1���&�6,z{|:<A�i�g����/�K�1�XK7F۶ȳM����àz��h�W�g_�nn~�>��c>�S��p�X���CȲ�)��"'B+���!� ���vtp ��f��ず��N���'ᰖ�g[��Z��λ��w�I�� ΚN�!���:�j0F��g�B(x&�?��P1���\__��m�`�i�#J�c��4,b��LMn���G\�x�{$IJ:+����E�����YGZ���y��x^�C��=���`�i�!V$�_����50�,��f�^B���f!�T)BX�߉Ot��<��xr��D�L�ֺ �%�����אI~'��,p��y�)7�=lᵁLL�䥀͡;� |1a����9s���/E���� -�aGwp�)Q8bk�I��0�r�GS���R�k_�*��G���_`9�#K3<xp��b�  ��C�!�u_��c�뎤��X\]]���M�A����Ҕvn!_*�S�R�����0��c��F*�ƛ�c��P��lFߢ�3<)�6��٢?����ؕ��f�E�Q��#����4�=���!zr(Z�vpg�2�wC:�0��ߗZ�2l��݅����!B4����E
E��i�(KR�Z����W�Ƨ���v���_X_=��]�E����E&=p����I'�6�,:��{��r��G����>
ٽ'D� �!>vK`� �7ھԲ3ڢ.+Xg�$)�����*�������+_����OO�>���<�	���@@��lASOSZ3S
աơ����\߮����SG^䐊�i*���`���DE(&�,��S'�U�NPw�:�ե�A�2�j�8o�s�<A['d�C�ւy ��5��h_�I�U�v�#cWWh�\*��4URb�X�,SK�PJ����,��C��5���VU�,jӼ@^�H|��w�N���x�im��/����H�	.=H���Tx�t�'���O�����ɣ���o��]s��m�/�� �������k�!��x�u�pNz�;5q��Q2Ռtw�#�;1�ֆ;�|�C���ݸ�����H`���=�!ϟ?ǋg�젔����0��1�/���~��wd��KM�����#x��5���f��j��֠�cW@
9vP�JK��p�������
@�,�F���������H��<���k���%��v��&iB�8����4��IC��.��Y�N{���㜏)r}��4-�O���֐�2y���@��we$�`�7��bdi�����L�����_i�f&��o~Az�8��lh�#tݱ!���d�?v�`��;��|؁ɜ셀�m�:Ou%� .8o4�´�0����G����U]�_�V�USV�%��B��!�#sB�D̍9<�Q�	��c�mwx��gx���pu{vƀ2fT+��8����\C���0|1��Tøh�9NNNƟ�"5��� ����9ݷ��`�Icdy��׸Y���n�1��qz����	�*�z�R:��Zk�7ld��T�?ٶ-��D���2�%]P�Ԕ�~����s��c�1 !f��T�:��|�+�Zm����������)�b�~7J?AX�ԈEDm������}���a!��{OA����Ap�`z��ZX�Hi86fB���x� d��Cg4bAoJY�#�n�ۍ}�at<�(�R
�Z2�M���~<�sO� �b()a�G��x��^��BY����$��C1)�"EG����d�ť��Cv���ݨQ,��lP���-��!� ����4�^��Gx��%N��oL�t�t]��|�+��� �_��|u�W���=�<���o�B��tH�:Fâ� ��q�cͪ�:�5���"9�u� ��0���49�q���?�*�=������� �>1Zs�������8�Ќ���6�yX��M��#n9����ǈ7r#朜,�eo�����$���!��b��@�e��>D��E�*��pl�mU�t=X����ᐳ?l�i D��1�+�M��XqJ��$
[jY-�'AR�`>�Zz�^�p��v��l6�o�!x�ʹ<I�9�Fq� Ib�Yc4��)����%&�N{��@�2���H%��}�a2�h��<���u��C�ȁ�d�á���%���o�����Ʒ(w%�e`���*���#��$��{�)��]���wp΢�j,�S,fH!���$h���h�"/����2Z6h����d)�8;��>b>_ �[�h��L�"�W����������?=;}�a-�(c����hK�+�Cğu0 �U�硃�#� �9~�8���Y8F�G�uM�0���8�b��K���P��"�4� =Ǵ�`�ێ݆ `O�M�	�����2� �b�B������f,}T�����(�1�v��Lׇ.	���I!;�"/$c�XW
p�����3��j��9�T���h�.���6z�kM�.�n`
�=���WWWX�֨��Ȟ���_�ZHu���t��b�,O��)%Gp����tC��&�T��%���t<D�m�4�pݡ�i���Vu��9�`t+0��.�4�����_G<I�����X<�K���x� �d`TGR��<���979���\*�Z�a�i֋c��gn��t+�q�������WPJ�(
,��d1G�j�v;��{���}l6+8mF�w�����c�j��^B@qI�m�hBB�ܐ�le11��| UU��)' �4�ȹ�56�꺦.�s�2��L'SDc��Cv�	�^UUR�o�j��Ԛ#� R�h�S�jܮ�ެqu}�5�'	F�7�&Ѵ��g���X�(�8��H�1璦��\bY��Ѥ@�T��}����?bg��=<q��߷x�� ���c����o~��~�������ɧ��2�6�)wpLwp.�3)�F��A�J}r:$�j�^>� �⪺)���Y�,�����nR�%��-V��(��>}�����3Xk��Mq{{��Q*�$�'�p�K0g�Q��IJD��!��d���A��id7k��ɦ�E1AQ�p]W�����n���H�2
fh��9#h���^�>$�@��>%)�0"������@�J���4%��pL���"��9��=�=ʒ�D�0_�����J��C0���C��sjQJ%aC*3�#"��{7\,е��J4�y�sP�I`���!�u�����O���7�/_8.p�㜣3� ��z����p M��ag�Cސ���a� ��f�����GNp�i��{��w���CѪ,ð�/�s�u�˫� �YM��n�A�y�l	��,�د7Ц��δ��T���'DF��Z��� I��n�ŋ�/���%��Ȋ)�R8;�R]"<ʲ�~���q����Kcy �)��O�	�����<� 	����p8������p�!�R�
�3~,z���.I�M=���g��5-����(&(��s`���9�@�m[C"Y5��V�Gi��:�^c63R�5����Ύq�$�����6�J� �ѽX�qp!K�q�5�6���]�˜FYV( %$�w���UU���P���NUV0���R����E�a5�|=|�/�0w'zGa� m�i����]����/�� �fE���=���5��x�<���ɓ�$�)�<��[X�S�V0�9dIN�.�C�ЇG��B�Ӱ��1?�B�����ԑ�XCC��.�9��DRZ�1�!�2(�Z����2r��Q�1(�dHA��o2��?�h�X:XgG��=��R
YN�&�$�L�N)j��`��E�7�:���-Qr�%�VB`�X;���ݠ��ǡ��Gi����-�Z����Z7蔬�Cʚs�z�M�cޡ�+��m�>`;����� ��)����\1����|,5^bW��P�3��B���sqE�q�u������������X]�1�%{��]�f3,�K�f3(%0_L�d]gzh�x��VB((���`�i�&�Qћ�0�L�"�)�ܠ��5�M���Wki��h��q�Q�Q���]�/}�p(�c` ��9	�Box��������Nn�h{>��1�&�R��s�$����jX�b��К��UY�6��<k}!%����,Ĳ�N���k�Y��bbh���
1��TJڗJXk����5��%����wn�����{�$��c��vqFS�]�����yGG�MU8��p�
����@E���ۡ
P��~�(R�N���ÇA.I'u���-� "A}��bJ��Vc�^5ԡ�0,�XD� �a�S���pz��	d1uq|ر�4#�j�#/rbo�jЪ�A�I���ݢ�+������Tb�ѣX���X�H�.;�I����se`t0s������&p�M+I�0gf��$���C��y�����Q�XVi���U2D��Й������}�1ƀ�!��FGGؠ:�����0䘺�]1�c�=����!ԗ5�p��Q�/���R�8K�`pڡ�-���Ek�����OJ������]��S��<�X�fp����y҇ ������ڶǤ�������'��9��p���憒p���pL�I���D�t�:�"�)be��E
*����l��k���"lWk(m�$�qǶ]���g'�H#�!�T�lR ��u2���OK��A8F�2gQ�{�$gE�b�w�k)8ڎ�jK:���i�A��� ��������P��|>G�"��-1-��45����V9�DA�)�u6Iikik5�,�"�n��p^��j41mXM�AE ���LN�d� �
��ӥ���8�-\�,q';���^��Zz����P�I����g��|y���������|�o���$F�DH�E����@�.�a���d�;������������q,����yN�ȼ(���}���!Ip.����:;�eG���r
�Fm��N^;@�Ӻ�p(�{b�P��j�y!(��9�<ːQ�k�~J����"}����=�eDDF��Q��{�h��$�_z��Jd���B?H��	Jƶm�$��NR�xX����Ը�4�.��9ɂ4���*Tu��i�ԱG��LI��������|�����v����ВtH}���L88��=C�����S|�o���,���o���I��G��Kh��"�+OCx�y"=������K��@p̄�twp���Ch]�О@2yA�
�1�I���[E�u�PSQ����5�iރA��'s��(`�^z�$�׆hJeY�-�^���� �X)�	��K5�v�o��GYר�:��?H\Ȁ6���F};ԞÂ�u�@��[��/��RI�IjRsL��G����Q����Mۄ���s­��<�u�(�mӢm[y)���0C5�ȫ:K3"���e��r�a"��'��ɲ�[�(֚�d
�8�=q[>��O���?�g�ٯ���y6ߝd�
�������"� ��s4ڡ�=�L�Kqvwz�/�y��/uK´Rpχ��#��L;�qc>�B.�B�(
�	֫�Q�Ft�qp`��4dAG�h���Ǚ����6�RrԓXP���~\��&H�����"u�YʪB]U���2x�Q��x "�'������Z����Pg��k�;�й~4���o7�VcN$��Lq�/m�uۑYz�M#�6Ӄ3>��uM^�"/Ɵ�5=}��1N�'��f���>\Q��y���}B�Ў�!+�Yq�4h�A�t�{G��\������yi��ly�����O��T�/Z�͖�)v�5i�����^�s;F:�X�w�vpw$�׼�6j�	�$�!9G�����Vk0؞�R�4��U۠.�����1)2X����N���*qd��&�M��;��H�ԓ>T%�� �}g'
I!KDi����NC;%#�M�.&���b�C�U7(�
u�0dY�=L�Q75�C9��qHb
]=9Ybyv�b6��{j�A�>ቁ.9�zXdq��ѳ��A[��b�d�E^���@�\p�?� �y��=%�X, ����Z2�$����\�8�qx����`p�C w�4-��7h�&�'<��T��m���[lv�3\�ܢ�f1	���Ϭh���R��������I_�?i��Mۣl*Z�Yb�N��Kw���ȿ[�����[Z�����@p���b_�@7I]U��UY�Q$JH�E'�=*��>6���z�<4���j���	<z���7Ⱥ�)az�^��ʆߡ�EFy�֠�(-�$�-����ip�Q�ʲ��L�JE��c�݌�I��g{;�b����� K�'9�J%ἃ��E�Q*�A�?���VtV���i�AI�,/h��/�Y(�0��p(AK�RI�>B@H���3E;�����90���|�|\�2G��U��v�������,f�%�b�0�>�!Mht/��F9�g3��3��O�3�Kb+� H~�{��7��Z�n`����ЮG]Wc�K���à8cj�cF.H�T}��1��ΐ���q2	D*
�*��ƣ�M�8�$�r���'���
�	�=i"�
�0u	m:��C��Ja�N0�p����W^���)�4�u���$������eO٠�X�V+�P�5t�[�M��|��|��{#(�{���q���u�>u��M�;��ڮ�6�( �q���I�Ȅ���]�3
�[8�1-�Ʉ�!Yv
x��-m�\��棛�6��Z��;�P�5���?�ċ�<����x����O�Y|�ͷ�I>��η_�w/9ݩb��NT��2J��͋���0d��Q�e�Cc�"�wT���ÜG1�1��v0ւ3rhk֍nrEНA����g�]?<���B�z�Bq�dIQ��4RD
\	��E
mh�i��[�V,�I�a�\���_���hܮ9�	�z��C�{8ǎ����=~�7^}�<���l�EQ�{��n�M=�={FN�s�]� ���x.�$K��{�v��@"�������`�y�P�S&��W4�Ѹ{�Y:��*��"�Iڶ��m;�lԸ�u]G3��v���kr,Y�e���f��$F��~���-�_��;����O�曟�_�����,N�/-�?q����'_^�;��������P��;͠D��xvs� �;�T9G\n�<AI��7A9G���kH��,�4F�䰽�fd��$98gX�WBS'���IAH�i�l����� )� ���2N{�^C������߇�@�x����%�u������
}�`������?=������8��*��ޮhk ��t>��{� P���-�1�"��v��|��d%���pv���%�5
5'�Jr�%����"I"'�b��d��FԆ�`�����33��;����|>��eY�V���8�u����,A�ƠT7;���1��K��S]��1�@���Rh���z]a�^�A�s?���O�9�����胋��Z��5���"�|����m4����jEÀ,�G�B���R��꡽C�Y�M� �6hۆ\$��ir�*4.%���1I`� ݉�X�[��H��/; )���'�$���]0	xF5铧��9<~���q�ޢ7�m����E�`9��t�ē��g�T�Z��J����-ꖰcBdy��|>*%�s(�*�/m��s<y��?��Ǐ�1����5��H��ϧm)�z�|�R��FSR{�� .��p��iJ5�@S ��?�Q�e٨-��R*�-��$�`�C��n��-Tk�ͺ�[�4�1���FY�Ȋ	>=�O����������=��[����w��Y:�M��%�Ͷ��_0ڠkjı�<��(H!��
d'��X�)��Hs1L�|0�1M[�*K(�-5)$D$��^z���'IRp췻`O���ga�,EoK�#Jbpg���9�\ע7m[�1���IV����t>����H������z4fo�:����8��EE��!�v��i�G}�����������
���͠��q����?B:�m�9���A��kM>��&���"��9j������;;�6�x�d×�&@��K�����6H�)�̈́��{;ވ���(�3̙��G������Z����,ޝ.�K ����~��� d�d��B�13��t�<������BHRv�HR��]t 3��Qc>_`:�c��X̑�Y�|6��g�:(�<,��$1ޡ�=d�!))�-R�$,l������V����l1���Kf	�l�Ա٬Ç'��bI�, ���)���)����|��:�f�u�,�K���������~�.߽�HAJ���`�ԍ�/�@UVXݮ��@0N��wqo4-P+��EΓG4I�uM� g4�RH�M.�Hw�r�|X����{CC�b�������t��髯�s������1�@��r���š�Bߛ'�}�gx��$'gz�A2��m2��iZ�u52������ �[lW;\^^R�oU�,�U������.�(�����n�x��>|�^�X.������<`��n4ھ����D@�i_[���`�6��x�<�%8#'�=���AS�h�C("���|'s�����Y����'''�L&a���K�X$:�dw��1ch�.X-������q���5ڶ��P��}�Ճ�-�c��'�����n�N�]S��5��ۚ�XB"{��:a�4�9�|�%�:��шT���QU%e�W���P�"D���^ N3\�{�$O���Y� D����~>�����{_��7�}�4��9&sʪ)�T+���p�~�:A��z�������-���Պ�CM��.Q�5������WWW��Y����0�M��噊˱}��!�1r�hK���Q�H�$��G��݋xzD�r��^�Cxӷ����C��RB���,�P�M*��!�;����5_��<��T�I<2ȣ(i>��{T�q��$���rN�0��R�I� R��ا�_��+ ��4]�HT2J^}p-d"�6�����8c`_?@�qj�6����{���|T�;�D�[]�� >9��_��_x��s��R�;H)��T�I�<)^��[m�/K|���������wp}u��*��H����{��G�{���p}u��v.%�Ӧ\�BZ�\3h;Gf g��y��� ����u�����ǁ�q���
G���P�� ?��}J�Vޡ	)	� $�,�	?o��s�p�C1'�� ��C��9m�8�Twe	t�t�b�)4���I84:mP���ڶ��UU�2�(����zwҍ.yk�g,�E��>�Jm�<�5�S۶AU��Dw2lXY�B��W��Q�������,ξ<_�i�<���r�<O�-%��M��`����qH���F�;���w���
��V��h�O�0��֠k�� ��-���-�8;]��p80c�KΆ6�d��y�ػ{����Y���6���:hGzmg�р7�Ɓy�&sy<�GC�>x����-���?MS��э肫�� ��*�m�.$��b͋�J`��GR@�&G������3j�HE���Z��,d�C,�1@D��~}$'ˠ�ڽAU5��?:zdL?�h"�6}����Z�`�&�i�w�M���Ơ�4��Þ����G��G?�X�bo��9�3[�_|���}������t
���;���j��a����
/���ݗ�Yoquu�,�%��(�q��KD����#��`=�����կ��m0�N0�L ������3 �S$!��6J�`$O�5g��A]�aa��_�� �N���������������B��d)�e�������	��t:��]��:��0g,t>��@�et���P���0X�Q��k3�$ ���۶��0�~�{`JFȋ)�4�Y�}���˘�W�R���� $S��2�pv|?��=�#������ؐf�{O��777Xo�/Q���/�� cqa�+Qw=&�9���?� Y��e����������`�� �$�\�c[�Qw-n�k\^��j�FU֨�����IfI5�%Zk�� ��S�tRw=���@] �"z���s�f5���X�2Ɛe9�5P�����f�����CI��5�i�����.�
"�0��-l0�zG��ݔ�(N��=t6F�0c��jر�E1,���=���(.�cIP �*))��Pb��`�/������s�����ܓZ�3�%I
���}Og���R~|���Q�W���V�6���q�#/
Zލ��w~<��כ?qM�@��K%�1&�45�hJd��ӫC,�j�FSU�և^�D�kd1=V�8��HPdTwv����q���mӣ,kt3j39�p�~��2E �4��޹v�I�6<1�#�s��-�5�q����zn���S�^CZ�m�M=ꬽw�]<깇Ԉaq��H�M�$�� ,ȑ� �t�b��x��ׄ:\d��ꖜR}�DE(�u8�eYFz���~x�f�YF&����"���Pf�}7�o�u�u�n��k��.%]�����Il���l�\�]?�����R� ���n���h�>�\�8�S2Vp����4��$N�sH�&ێ|w������=���~ �;�	���.�����ԫ��4 "�u($�u���#ȇ3d���kHNhvH�%���Q�궁�r�BJΑ���!��7�l����������9��zG;�qBx���*���9VA>�-��Z��P����Պ�� R"�͑��]y�(���CSU�}q��,Q̦�`����I���L�Shm�3�p@��ow�L
j�r�HH�*m=X��8��<�����m�O����g���ϖحV8�� y��P�-@	mFk�e���k 9%)��8�͠�~��nK����Qf�T�i��j�F�m�{d�K��p:�k���%�/�Q���pAȱ�ݙ#�H)�9��5�����YΡB��3����	4Ƒ�`>���W�b�ݢ�����p9�8��lL���="�@Yݷ-qc�#hǠ�Eߑ�1MSȠ��\���)�tL^V*BSw��Y�������-��
�?��~��x�O����0Ȣ��������������$IBv�PNL&9ʺA��(�q��%"�BH�X�,��|6����X,�á��o�0x���������'����G��G��������'������~�����	&y��d�rJ�G��,8E8")���D"Q�wh�	V�!�����[Hc� �oP�)�i\W[1"�ﲨ��N��v:��r���N�Ԭ(�d)�਻�:�}�4I�\.Gzir0��A��Rr�G*���"5���X^�F���>Ɨ��SO\8q��rq<8��� x�˛k�u�hs �����������8�nz���}y��H���w�������w��\�xf,���bb�CU�h��I�<�0_�E	�"X9	� niN��,�\�Vk0A��lR��O���<~��t�~�u�C[���y�O����Pbv��r����� O���Iж5$��H�Y!���x�Y�[��]G�4I�B|	�5pF��	����\`[�cx�G�/�� %�Ҹ�-���I����ȳ�Tv�����3�(B��#����@Сk=Ͳ*� pR�(F�s�9�)jC5)�� X� j/e�p��%�gJ���%ڊ"$��W�+4�FZx��'��?�x哟�_ǋ�_������'�����?�_t�������&^��.������+�Q��=@���#J3�3�`H�T��m}� �S0������-OO���#���O����/�t�����o� W�7?�5�iS��Eg��>�LPU�ʔB����7&�hԁ��F1�����	�v�@Ԧ�>Cǅb4��&��739��`�$'� ��v@���1V� S�`Hcq 5�7q�qE*A�����-M�60AhQpx��-m���t���#m�jr/��4,��`�!w�\b�]����������_z{�|�{�G����_�����9[.��/�_��AK�,G[7!/
��BD24�R46���)�h�S�Q���m���)����_������<��e'�vD?\?�.';��?��~�R#M&��J0L��d
8���-8���Y���� Jb�m9&E�8Qh�������x��>��d$��N�8==E�f8;;CU�k��D�A\�u�4���A�J�{�"��{C����G[kxF�A�-��� �<�������'G�u�AwRL� ��IH]��q{{���}�I��l�)��|���RJ
�.�,DBA�Br$���qDh9Ҕ����ł���'gg��K4�-�P*�[?���������s�;Y��ur���^�ě�������/�A�I�#�X�� ��Z�Ca{�HrL�"t���H�	>�1�/��������3��Z����=]����Πi:|��"q��ZcӂΛi��i(Yx�o8O�D1�|���������ݗ�U�՘qvvF�-�I�-�1oso3�����^�l^bC&��������HS�	dL"+�)w�q�,b��J��2v���aȥL�Y������V�c�����h�- �I�0$�0�J
��<��fSo�{��zp�ϼ���O�>�g�~�����w�q[cg����%Q���!�\�RƐB�J��5I�d%0�����t�{��x����{�������/p�w�l���3x�!��P��wYS��+�i�i�GQ�,�qP;�V����E,bp�,��-ؗ����Zӡ4��	�����s��6�A �:�TJ�d�`x�����a��X��DQl��>9y8�6��A^�"��Dп����CF�<C\�hi�T�[��~�!�qUW�v�*���{���Z>��a I���Q&��H���4:	� $CR�|�X�s�8M��ko�������xv����|�ƚ�{�%8�`P�8H�q�C�|9"$�4�i��(
DI������C���O��W?�����=\?��/�|���?s_T��s�	���0OA���iYJDiံ����(B�T�z�:���M�@H��t���	NOO1�L���~W��OI��t�Ͱ�z谤���3����#D�Î�C�qYNd+����Y4u7v4�"s���z�C����̋|T�i�y�����%�D�"��� �r���}HVR"+
�m���o��W��o}���˳���Nv�.g����[p�[.�H�^�L�,�y� qL�	���t&8�I�?��X����g������ �09;������g�B�<D$!��H/!"R�W�������i�9�,R�H�<UP�#R�"GQXLg�L&x��9���(%8f�S��%Y����V2���!8������\�Í��N����J�d4��~:dzJ�f�k2_�mڱ32�ʦ�).�]��oQ���������uբ�ZXX0�a�%�WP�
AC���Cy@�{�i
kh�Mr��-e�Yj`'���:~�/�{?Y�?����n��ȩ���d��|���8�~���״HP����t��9���g���'o�����|,����ϡ�~�¡�4��qEp���"bW���mǝ��:�H�[ghP�mG�@�IN��DM���}��j e4�:�+��	'@D*I->��e�Xw3F�j懝׍}��� �^�}eJ����e�(J���{ a��"��q:*��z�]�u�٬�@mKIo�{Tu�Hšk!Ä��Z�(�phkp��GQ�~����	2��8�
C8*�$����Q7� �-��G�5$�~_���-����݌'�w���7��Q� _L��1�$�!�a;*GI)�wK�Xp��`0��I#K�Hյz�U;d�$Tn���f�F3�<��ё]}�49�����#�ʃ��%b�u��7[��Q?3Hc,��&�	�;5M}]ꃿ�#�e�Fk� � Á�hsW�I%b�!�G�8A��Q;��	c��Um���|9���_C%�z�8���>�!��-D�M���h��zc�������=;=���#�bDqL��wP1��|��|��|�j\ *$�y�I1�xn)a�ƀ�h��c�T�eݷ�zԠ������a�\������Q��g�k�\@��N�� ��c.� ���yz
1 �$#�1h�����\t���L���c���������pf�Aݑ��x�|��������IW�.%k�3l�e� 8�d��Ab���$��g�	nV�������*���A*t:��3i��髯��삦f��Kza����j��H'�'�S��0M��4��g�9��/��9��H��L,<���#/Pe����,LR���e]�8
���B),�K��!�)�PE`B�z��|	m=���d$
"�w�d�Hk�<��5=W�C*�����&�Y��l�(,V�y�9�f� @�R��y�b[Vh���������xj�p9�w�F�A�L.9���P(R�E�-������Y�rxj�A(�b2�|6C��ϗȊ*��=C�bL&� P��k\I%�j=�-�3@
b�3��9����?>��#�&�"�&��J
���<c�v��z6Dv4u��i�R�F�,����%�c������PR��T�(֘�P;\��?�$BA�}X��]^��ɯ3��)[dy،�9ıB��>f�3Ig9NOOqr~������d������X8�Q���%�Q��=�aIJ��y�> pX��`t0MR̄���f�r�>ĂD1&9���6����Đ��=��1������I"8fxX�"d����⨯fB�2VjG>��j����B�C�<���B��]���<BJ�yAf�pPVc�E^�A�3����a�F��N��9���0���8@O2��,��-�3(�I���vk����=x�{�ᓧ����������}��f)��;-q (�DH-�IoiLC�up��3�N���2��S�9�b�(�P�`�`�j�jj�U%���N�Ll�4k,Ar)�!�}p�·4���8)�� kij����zJ�t}DJ1�ȥ�����,��?�r�t�P2l�8�Qڀ���I�Wg��@���U�}'�v���9�,c@���<	��4u�w�H����������'���O}Ͻ��Ǿ���`pJ̊	�(����i��os��3���}���Drs�i>A�&H�s!��Of�/N��v���-�R����,<�`��ݞ�`��1D*�>���FW7�\�s%��P2F�d�q
x�(�`�ƕT��Zk2�z�ms.�T��(�������E��bI��I 0"3�XA�ƅ<��〵J��$�)�(��p@�5/-,z2D�FQ�C���	�{����+_�ۿ�����|�w���i0�/�M�ޓ�(&H�ãd�G��E]7�X.��Xi ~�9;�d�Çz�9wLHJJ(#�R4��p8���&����H���s�8���eYQ�|]�`�zcG{���'� Ir�H*���� C:wܱ�7��)E���ԥ��;�;2��8�La�WM�$Ip~~�n6�	���TڐS��Q*5���4CׄsN:F�d�	]l��1D)H����R~�{+QnW�o�ο������_�S���`89Y��Kx�дn��F�e�s>��H�����O������/pc,X�k�$.�;ا�C�M(A!X+���b����4�����8�E�#JRҔT%�no��l�8��p��<�hb��1M!�ġ.Ѵ���<ɐ��[tU������Q�H�����&��0���hk���Ⱥ�����WQD��dB ���Ң�JZ�ZS��_�ڑ>�+�s
�
2d�tgF��pp�ʁ��*N��ܩ��{�w]����
_��Wk�W<�l>�@�7�݀R S��[��frJ�����n�Ǻ��'̈́
�j�!�ǍC�-ea:ɠ��Y�۫[����vw���qV`�/1�������n�PJB[K�qc1q�����<��7�U�P�AC�(hI�Ȳ,�:*��x8C
���D���A�,�Ձ�s�����(�
]�	��1��|����K��q!���n�1c��0���r�٠�k̊���1��@Ez�ɴ��g0�B�B��iq@$�n>�`����혬&�k�1� �q���I�6m�Б�~�����u�����<�`��Ѹ�{�$J�E=��w�I�(A%�e'�sd��=C��n:l��g�b�8��z���-�������d�I1AӶ�l�0Z��MI�W�#	�ٳg��Y�Y��t�C�`H\ I�C>)��!N�1z��k
Bj[4M�$�U�g��7�-�������wv�T������֚g9v��F�%��6(
�p�{�M��zC���"���<�$*A��دw(�XТ�!��p��M��DE7���*�������Z8�q�(�qrrBd���wY��s�����'������(}߃�I}���x�*5Ԕ�R�	`�����9�]y���w�{��N-9�f�	f3
�m�i�����av�5������,C��#�/K���]U�mC��W�c�����Q%c4=����gϞ���=���CK]7��'�b#Mɛ(GY�����!����f)�� |�lF)����5��š�S�H���i�S8�u0�L���'\R�k0o<%4�ѹA�1e���簻�?��t�( ��$���VĬ�F9|�)IJ]�ӓ3h�p����-&E�<O��1�I���)f�N���t-|��w:	:����~���������,g	%/s恦nB�1m����IA�M�`��B�>��pJ?g6�A���[c)|vK�F�8�/.��>�88J2�+��!O�]��b���q{{;�FtO�����@�vȳe� M&h��1�C�l�]4�����޻6QD�'L�0օ�!˔q�}�+��G��S��x�1e�vrk9���QM,T\L&�u�I1A�TH�4�~,�<�d�#�ȹ��nɐB0��RM6v<����(��NOO�	ƛ�}�����4I��u�~���cSÃ�O# �� �ɣ(B>��X��v�j[�vu���[dy���BF>�T��j�E1�f���� ϳ1kg����简��P�%Ux�á��������tm;���w�&���Ia6���ԣڱi[G\�A0�Au�0�\��!a�O��<����{�[���Yb{8oC����Һ�
$�M�,�x0�*�&S�p�ӓS<zx�ydY�4�i'�;��G,`�C�.+�\.`Af��z�A]U�������k8=;���e}���W�j2],K$	e�L�	�<G�ux����ߗ�m���R �rL&�iJ�Ƃʉ8N��֫5֫5���q(P*,�a-�^m��{�C�m�C�b��q�P]�a:�b6���k��l��d����$V�V�5���G�Ny��t��}> �)�bZ�]h�r�i�4����p�!���lm0^�I�����z0�IF)��u-km�b��5ӄM<����
R	0���b1]<�� ���5���~�F7|��3���TeyN��4�C�~��ϟ�ٳg�����*R�L�ڕ�	јB'�m[l�[\]�@H�ӓӱ�ʳy����(/���HOIkb�\bI��g��r���B��s\\\`�\`����z��Ө���@�3z퉤����z��k����/������ ]�Q{7t{`?���=�?w��w/�P׏d�w4ɒ0´xS�Z����S���`��a2)��)"��p1:���؃�8OI�u]��M,&|�"�^�G���J�������3���{ȋ���L&�Uƒ���5.�.�޳��/g4���f�r��y�Қ��qL�ey�Hk!���~�s6���"�v�}�Ƃ�ysX�f3�f3�ю�K#˳:������ͳ��ʯ��?��_�5\�x�< ��#$����?L�1Bܘo/7�A^?�>�;���q�J ����'�hW�C2���ay����� R+�w�i�Z�R��>�4a��B yX\ �X7�+�ؾ�9v����ndo�m��Z�*��\,����Eʲ�����'Q�ѣ"���R���`�ea�0�/�DQ�#i��q&(T����$B?�;޽o����w����ݗ_��ߧR3R�%)lG~R ��9Aʠ�w�Ӕ>�s=����Xx�6?k��c�c��QҢE�5荆І�CD
R�W�$�	qz���3dL�8lw��$�r��ר�f)��9b�n��;���H��锰iQ�N�xq�U[��L$% ��ݫ��Y���_����(f���hVJR��4��I��1	xN�ŦAo�5g�
��Ȋi>�N8ꮃs$'*��S,T���v��DO���������kuu���+����ޗ�*|�W�A�ֈ����9�sLf��KJ���4*V�9���q<.�4I!��ӹ��k�(���!�V�0�;�@�vx���H�eHɨ�C_4�C�s��Z��o$%�6��}�c��	#b�!B�s�$�&�emx��C����o��nD�����I�"/H����z�' Ѫ��oЎݦ����,��bcP�o�rf��w4<�CJ@
2L���/_ח/����o㏿��,f(��=|�B�-�M��[��y�8Lw]�0r}����A]{�R���
��uF��V�m[t��i6�E�|
�E�$�ʈ�3��?x)��e��ZweY�i:ZJ�fK��f��cք)G��r�����=��z��X.��/����"Y4���	��s̈~x�������N.�u�s(%a=�$�T`�;+��𙾮��G)�J���Q��TfEQ�Œ�	yA	l��.�z��Yp�a�`+ca̟R-
 B&(� )��+a\	�8����`���`~���8�j���<A�Ƹ�C�{2��qLʻ��v���*��z�qw�W ��5�f$��5I����X"ti���b2w�a���t�E:$������j���~�|��?�%�6��B���.��Y����}��������}��S�*�0�Q,y���|L�c�@,�hlЈ�)��8�gi���@�D��Bx pP*��2����A���`�c6��Z���Y���x�_�tZ����mpq���=���l��lƘ�$�Q�I<~�;��$���W��g��q��e2�f����G)f��{�ӓS���tH4@�M���31�
�4C����AU�X�6h� G��=%�_���)��]k�Cn@_��t0r���v�{��������>���9�W(��bȒ�38Xf�s�,ϐ�	��4�Ϝ34�6&�ňqv~�L'x����8I(��n6I�'�����G�EB�"{@54駭����V�1�Zh���?���'3��CL�Y��8\��3���Hl�S̘2�&!ߑt������$�dR@p�4σ���n��K;r���>�.�]��D|���Hz��iߣP�7'@�nm4�6c4�����Vp�D�"͋�tP#:TU�"J^0&�ߦ���������g���l��d1���h�]�^S��@�H3�m(���!�s�W�0�|��1.?���b�/Uv���wq?����^w�/&�pEp�K\>˩W�_=����PWs8??EU�8Xo��{%c��\��ju)��)��� �ZN`L�x �S�N�V�X.�H�>L ��k�mk�!L�$��wAy���t��߽� 65�]��V�A����\�M[����9��I�k� �03 ��w���5��8��1�k��e���폑*���Ȓ�oѴ�u���"9�%�(H{xo����5�pX�������3�ŷ���n�:����Fްȇ�J�^N&|�	�>8Y:�0�Xg�b1�Ž{Ļ�{l�\^]���}�c�yFim��j�+K0! ��N�@D����A�)�	�"�t:�!�
7�g9�6��T4�2ܻ8��C���kؐ��#˳qҙ�g��C��p���`:���N�����րK�a��c�l�70�����*
�H]?~� �<�qTok!�Q��1+*��b>ެ ��C
�s�������~`�7�1��J�w��Mӌ$�X �c�`��h�FS�ޡ<�-��F��4(r��U�9^�U<�� ������z�$��.�-P�5ʺF�ܮ��2�[l%�$E1����Q.#p�gy`�Hd�SL�1+&����-�r?��hW7���S8�Q�wݘ�6\�q荅�t� ��T�E��������I�&g�����m�\\ JSl6�Q��M~�NC����	�G���(��4�t:c|'�C��=/����_����g&y�l1q$	�w��Q�n�d��gg8=?G^d����`��[�=%1�E9�(9oM~`=p��>d:7�~'ixx�D�yD""�w�H���ź��V��{^{��p�4XC}f�����
����D�w�_>D��}��v�o|��x���x��S�,���!�}p�0�����T���0D�E�\>�R����󃭿�Gd���ġ,� �6a�C%���r>�B��(�)�ʻ�B!RɸqD�B�qlP�5V�kc��c�ڠlj̦��O�>��?�_?y�տ�'���b)v_��_������߼|��`Hlߎ~P�4[cȏ��Y���5�|��2�!$Zoi����0����.p��� Ft����v���4B�q��b�wΡ��Z���+����x��<xp��-�����N�zu��Ӹ|q���/�������OO!�Mע�2�Q��80��� �8���;�5�N���Oc��v��>Dq�VF	� 9������,K�[�%꺦�vk1_,�����F�d!�H�||}>��p���8P���-&��u�t��3�J��O������}L��n��>ߖ�������k��_�Y��^}#�$t�Ak����, �R�y��d��'s��(��R�{Y����t���.pgf����C�@F��hPJ�f��4B�����t��$�l6��}߆��mvh�Ŷ�=Z��PոYm0����o~�?���v�v� 6�=�Ha6���-������ݴ	]�U�OS����^�
��h�����ϊuu|R��{l6�[ߞ�CJ*CU��v���
yR����]	����)�w�����AմXm�ؗLK�؏�J�����'x�׀������r@%�����׿���������K��\c9�C����������_U�~?��YjY�MCC ��Dkm)(@;��֚�zK �n�����t��b�Ǽ�4�Z^*RpƠ7�'x#@)b����<-hiZ`���{ַ�ج7�n� �x~y�^y�M�ԟ����}��_�a���g����˿u��'�K�$E�kl�%�V7+p��t�c��)��@5�$�}۴a!�࡯-��"�Ȃ�]*.H�m�AS7؊V�-�l���p{�F�<{�9�߿�Cՠj:lvD	A»�C1�`��RD �ؗ5^\��p������_�K����g�m1?t�=sPJ�����/������7��~�Z���+8Y,�������\��QNi!�tP���Hb��v�E۴�yz��M���t��^o��N���ko��=�9����Y�	�^P���k����'���w�P��Z0Ơ���Wՠ�-%�e)f����6{�r��Kd�%��3�������O�O����ot'�I���NNN�O���j�����ڶF����v(�M�PPTu Y�~��z���5�
'g�89�����2��-�!M�{�^/KTU����0��vK�gϞa��!�s�������C����x����ګP1������֫��-V���n�Ofx��?������7^�G�������g�R`��ay:O`6	 T����nVx�k_��1-
�Q�-��������Z�w�6z4W�5eUA��P�o5��y:��.�w�O����[o�B_�8y"�q��3j��I��;�$ɠ���^�@pbc0*RL
U���z�4�v;�vXkPL&�2�t�B%)�׷�Y��$:��������������붿�{(�u�B*cz�U��n3F!6�Q�����lq{���P��5��9��	f�}ӣm{X�!U��l�9G&�JÑ�x��կ�y�O��&��_����f3ҿ�� H���s}��7�y���_�z��l6�O~�������^{�M�q<{���7������������g��4����l6���q$q2_"OcxX�]�4N�M�ݷ�)��1�ȋ�͙e�,#q �M��<q�n·�u��N�0����rQ�����.��_�%��I�F�$��"o<�>V8��S��#M)!lp�XkQ�6�-Ex�Ź@��X���1�Cۢ�-<8�,8cp��^z�fw^���� �-�"�|6A^d`<D�5�K�������z����WX'�M�Ac��du���1�-�dL\�4�v�GU��N�x��7���obyAT�,qX�pw�Ѷ��կ�w~�ߢ�=>��O�у�x���`���7�����o0�L��ob>����=0���k!p��Aq	�8����&<uw��7m���=
���'�3��!�d<kyO��q1�l6���X�)_���]�|a_���*,pY'I
m��0Jҡ���-�w`,���������b����t�$I��l���6=�<�l��d2��p�ޠ�Zoqv��<�7=X���u��o���c���5�<��;�]��ΑfO���}�1�߭�k(!!S��i�''s����z����n�<{�9������5�m�)s����x������<�5�TU�������WW�����or�hהl��={��jq��T$q�X��������'�x�_��נ�o��*1U��}훸}������E��x��!NNN��D�̱���v�AX���X�$�%Ҕ���3TU��,I	�YGYU��c��������<����6?x�F�����?W�)����1�$�3�8��`�b����z�wmc�Rȳ����fc��0ͧ9.��ô���,I�a����篮o���{�g(c ��=����x�9����Ͻ�@©���E�H%(�k|����;������u��%��YB����	�v(�)N�K,O� L��%noWP*�s@������-�Vk<�>���na����	�R��w��iF������M:��-��<���q~~�v��|���/��5�`��9^{�
�9㰽���C�=p�餔:d2�P�=e{�.%	�;��Y�ӧ����>�����_� ?b��x16��[�`�8J)��脾�1����1��z��m��v;
����x��1^}�u�����="�p��=��(縹�D^�Kc5�//!90�d�[6i�<���JY�ow��n��u�ӓ�q�gh�\��X�w���}��W�a6)��Ml�f�f3B�������6���ED�Y�#�c(%P�4m�I���#���<���$��/.�?졔4�kP'1�>FYh�(�8==�|:sMS�m[X��wod�:t�*�,�\D=�;!b�Z�Y���|s2��:���;�}w׏d�;q~Ӷh�MS��,VJ��Q�T�4�ѷ�*�ޮ���p���j��1��	���
�<y�G��j��f�$����l:Cj4�جn`u�ڶ�r>ǣ������5�4Z뱅7X���f�)R��I��ߖ�9N/��c?�Y8�qzz��.pv��Imh}�;��5ʪ�����gggX.O�X���Ͼ���+���)^\��Y�f���$I�o��� �sȈ DZ�h���Qnv��8�8�b>��b���E,%��E�UY�m��*�$����C����K�_Fk�Z������W�<�^|G�����#X�|��9r����	�vHDB"��hX݁G��P�S��	ʲ���5����DQ�hG�̑�)f�)����T5lop��I�A�V�{��\��u�!99�d��PZ�Z�"�І���&A�������?���-ub��� ���E�����x��<���|
c-֫�.���$ɡ#&��BY%0�C+�i���%���6ė񎅔�4,l�áD�S��C��P�c��!�b�1�:�C��b�{g�w���ѻ�ڪ��uE�,�Α�����N�^?���	�b
%#X�8*X�E*���@���a�K�,��*�^��13k1�:�:��a
����>D�$r��*M�D!�sY׊b��b�锼�U����5�/(��s�]��ۛ ���,�S����_�VX�V��J),ϖP�a��VM��/^`���ij��b�Z�Y!���������Xo6��UU�9��o�%,E�PB!giJ����]��mhn;�U�4�pvv�G��1���[��U���4[H��X�����W��tV �r�a�4��56�+l6�1	�@r���@%�,E6�l$�9L�p^KƎ*þ�^�� o!�?���Q����/c`�8�����DS
8�C+pP"DW���m�Pk�71x�4I���f�����횲����n�A�58l7�aP����>��;l�[\^^��*:�5xނ{R��]m��x��{gX.N����ￏ�￠��n�$P�z]����ٮ�9�us8���;�M��a��a�4K�v5�!x��h�m[��-�8xX�E���8Vd��IJ�1)�e�<��g)%��6#X态&��uS���$��IXI��$�t1E��N��n�,1 %�Cn�%ʺF������>�n��YC9��g��� ^�,�蝁��x��='�pY�����j��v�G�u8=9�3�,���p�+L9�v���Ơ�z����4�b��.M�NF�;��(qǽN	�ښ�khL�86�5��6�-����m��m0��0V��K��Fw�u7�$L2��]��.$�ݝ��`������X�n	!���{K���'�oN%B ��D�9z�b��c�����eU~͑e�q�8ΐ%t�*%�w�p�����!������\B
*����Z����p�'���/�8�ߵI2"�1 "��z�A�saG�2fAtB�^7`��t-�7+��+\��D]�Pq�V�ʯ,)O���8�*�,G��V����wp{��d6E�Rl��Bvޡ�����m��J�k-��d���(w%6�u��P^�%�����*D��a,���֛5��9(W�v�^�КHC�`a@�C���&�K���m6��b!�d��&y�"� &*�JԨ��+�h�������Q�5u=�F���\�}���q��p��0�"M#dE�4���r��.<��&#Jpo,�����s�V�����OY�V s�q̑V����H �-<<<,�wp�t����?��^\_�n{�ޮqz��������C�jȫ����;���sp��ء�^Մ-n�fDK�sF��䵻����#"(���=	�v���6Լu]�t�P�u�Z��)�G��+$#$��=����ض3Z��(Ab�ێ���"�(�`0}�蟽e�܂;� EM�Y>2!�s#%�1kI����#��8{�}������.�\?�6!���Hk��0�/�yX��@h5�,L��:cK��r��\�s���}hu�e*�$����v�J�S�PQ���RI�IR�x(��U۠jk���)����JB������ a�N�@��#��Z��_���N����~W��qhORMKF����� g {�&s�{JT�f@�Y����!��z���5I��<�d�!�S8��k�H�݆�y�����6ᬃ�z��1FM瀇��+���{���x��i�ǿ���Q�Y�ୃӠ��$z�(�8"�y DO��I���T��v�i����A��;ڀ	ڭ��L����v��a�BR�F��P�L����K8F����e �Q��6�wiSJ���j�eU���u�C�}�1b/��Ǻ��3ߓ��[�^���6֌�,zss���kEz�
y�������ip0y8���I�9w�7え�@C���eNNN��{q?��{�,�P	�����$�����K0���d w�f�J���d�#'IQx�����t�\���{H����ڌ�eY���JIdym�h""E�5��4��ǰ��f��z�|:�U���.��k��AF}��(�x��H�"b��7���P��������e	����Z�.����9��~���9i@ʒ�JeY��=�b����3JK��7PQD� �����<{777X,���d�L�����"=IS�����e�C$
 *�(�Q�2n�ہ�\�÷�>��������$ϑ(	�8��(͌@(!�ukzh��X�\i���	8'�w�k�c^k<{��Պ��D�!iL�M�XjD�8��q2'z{��~nA� W��M��PG)����Qۡ�5�ڑ:���{�RIr�kr72@p�;8wp�f�0�����d�!��m[�v[\]����%�i��bH��E�Pҟ�9J��E^ �2$�=8�p6tQ�^ǧ~Hړ^�?l/��ٳ_�k��&���ƀ�z�܊�A7��3�5٤d��
�j��5-��$v;����^��u�L������RF�m��q=����UY�� I���^C�����Kl�%v��;�u��n.P65� �a�Tbki2����$C��6�����4|�w� �B�Ð;4|�[%,�4��4��n��Xo6X�V��YJl��|��b	!(y̑\J�*�v��b�$&��c����6^�������Ǻ�m�������m��t9C�"0) 80��Y����q�8��ٶm!8���	Ȉ�n7�TG�i�,N �Q�U��n �謹@]��j�Z���n!��z��r�q�RD����B���\�P�(k
�*�uS�j.%���}	g=��C]�aw��)Ҵ͸c�mʩ�k��N~��cwb }��w*}�΋EbA�Rp��k��UY�mT��I�ggg�w�>���qzz�8Vh���F\���s����l�<��&iB���v�>y����]����ؚ'�y'
��(�0}I�$�A�6` � ��)�QJʈ�C�m�#/2�,f��!I#$i.hd���cXcPUV�-�z��n���+|���9�<�య���%��%���v�C�PJD�O�v�7+�ڢ(���Ǹ��9��k<��c�ݡ�\������w�S$Y���l�
��
��/��{��h����w�yMS��|_��נ��l6Cg�����t-��9�~���-��oq}u�,-pvvA��5M`i�[�e�Œ"L�ġ�AG�.����fs�:=$�$��"R�8Ya-��������l�4M!%�v���5����Iy���0c��x����?���T�_��	Zף���h�(�LLMJN�0�p��g9��B
;m!9P������9��8==š������f�FY�R���u]�X��n��b��zK�</^�p�Q�4C�&����4NO=sH���777��u]�)o��IJj��,qs{��z3Fno7[|����$�P�ԹH���|Ğ5m�,pF��E`MC�����1��Y��u��:^p�h�g9�N/0��pr�Y���G��d	�<�'mzQȊ����B(����[!d`���d3����e��j�����=��r�4���T����N�$R0��L�8�"	��u�}%���_��:���AM0�Q������mP��m�DEx���Ɗ	���Pc��ᰯ���'>�	d��Y\]]�Iz�B�8;;�����c���P��32E�I�a1'q��O����ɛ��l\�B(̦$q6��h�M���Q�5nW���vT�{��!��5��]�a>�#˩�Ӷ5���$L�)�P���t��"$Mx��U
��(B�� T%%���n�8W࡝8�?��,�$�C��0��8��e�o���s{������	��E׵0Ȇ7�~��^�B�[��M�t��CB}�9��}�vX�6h�
*��g9��#9Oh!��i��II�L��=�nw�\���������zt�HƑ�9NNN0���w�ۍ�UUU�,&�F�����N�h�F��(R<z@�^I�,����)eЧ��ssC����zM�w�َy�ih��}4������qvJ7}U�9Z�UY�,IB� ��=���l>����0�!	�n�8".��1@W�aa;��n����\@r��3����X��~6 �(��Za*��z�H4Ĺ��i��$���C�F�tt�K!0�SL���ݻ�,��TT�L�"�`����������c���"����(��9ʒ�fðJ2��t�sX��`�ޓ=-�H-y8��9��AH�I6�;C;�N��!CaU%��-��-��)֫^\>GY�ӢȋHdC�>_�����s�V+*����i�@H9��ѿ�m���aUL��8����\�{GQ��p��8ܡ?I��8�ER�	��8�q���|
�N�?�����X�t:�%��1�~��ó�Ah���W�x�9qO��6���0��\��q1[�Ӷ8Q�Lk{��C�T��&����P*�8�>,�bxΰ�h�.t_���6-,�H<�5����f��]�I[� $:���q�h�!�����8!}��i�Si�@�!!���Q�r8P�5NO�G�m�$p�c�ߏ�f����=m
Tg�p���I�B�#�9I�K	�%����~�=�*>�]�<�W�.�?����o,.���������ǲ���ůEq���⋲�Ӥ"�"c�9��v	��<���S{h��B��y�G��c%+	�P$_S��ږZv��Q��K	����J RE��I�BŤ�&Nx�͆v�8`.�/mz��=���(�����m�f`�4%"E��q��[tqCd����:;�ἧ����PJ�����2��i�N�	JS��N���.��%�⅀�E�����)�w�$A���נ����yxa�2
�- �(�J�s:I�q{}�͡��V�ӟy�s���ӽ� L��������A�Ā�����ħ�k�U5"��4��4 �t��0F�&�1��\[����T(�\*4]���H�a4�ĠidYA����̡nJ�3؅�F�m�up��)W�ݨ-Y� *˄��e�mL;������.�Ǯ�`N�����/��캲;o�C��Se�YUd�,�(�,H���z��yg-���e7 ��h.�5��%��WR/��� �d7M1I�X�CddzC/�{/~d)�b��J�@!�23�GĿ����=C��=nJϨa���,L�wZ�mZ��HS@a0$� )��N�&��i[|�g�^�z���Di�ɣ�3(!Q�*NZa����R������x�����=�,�H��T�NNQ%�|�Zlml��;Fj"R�k�,#�C�@�	�4�Ng^��K��NL(8�q8: ��� c��q|���������tJ�@]U��ӤMX75$��΢�M1=M"�
�G��4�G��jP5�Ř��f�)lU�x1TՐVjN�D����AY�aO�\�t�*Ÿ�TBz.N�y''�YN����<���Qyi�[�l�OVۏ����Cl�n��G�g�R�|���_Z��|8N{ӟ^���+\J�����b��5ܺ���߁���T7�a����K�g<XY�<~�E�e1���/��h�+�@�%)�I+��)��ukf��[���_��Cu�Bؚ�<�N(,D��c)���R�`��t���)Y,R�C�Α&��X�S����@A�%nɚ\����W�F��$[t��������Ʒ%%}�4�h���1��@7�J���=
�{�89�2ݢ�����K����ϯ����������wp+=�-K�\ y�b�҃�y���<�
@l-����S
�:��@����ᵳ��^�Y Ba}����������s1� 4�M����t�慊��<�Ȁ �2ٲ�G�8Ģ����H\ �3�x��tFR �Ds�����6��pC��D%H3�N��$I`�H����\�P�`�u&����#J�ж?ǀ�^L^�\�!9A4�EQ��"����dr0F��������~X�%�P��x�@'������C:��4�0�8�$����C��B��!'	�����u ��&2!		o�VO���mt�5�,��c�D���s{��;�l6��+JF)UL��MO]�D)�"��Lg�V%M��+���i����4�$'��=��$�$k<b��*����`���O|��0>3��$#m,���.��(�
�/.$�O����Ŭ��a��	�'�_{��׶���jr���1sX[@�j��I��ߤ�d���'BA*	jDf�Pk*A�1+
�275���]�8k@G&Py�gY��� @�qr_`s�]	�5��,�x[OR�	Ʒ05�i����!�kj��PD�M��@�w:�_K��,f3$��5�k�K>f� �Hrjf��J����p�2�����E�	ؙ�v�h~� �� ����Y�}��PkK��@&��c<>����*�K�8�O�v:9�V�_��&��<��慄��J���G��_��`���� ֦��Iu�-)'��*y��K	 ��	ԬF���J �3��IK�cp�5к�}[B.�W\㽀�`� �w/�$���,�BY�F�3�3(���C���'��uU�s�Np����3���$�J#��͂'*Ĺ��1\a �@�,�:�s.���"m���	V�,C��Rgj^���1�E�4M1X߀Js��_�5@��bmc���|X�<JmB5�g��9/��G�	�.1�\�DZ� �;s�[^[����4;�� ,�Mcg�V��y�!�u�<���*4Ɛ��W=e|�k..�&�󨱧�	kX	�+��sH��-�R*�uC$�<��agl�!�I+�ip�hc	,J$!�޶8_�RiD�'��`�/=ޏb�!��wiS�i�)"Kԕ�d>���	�޿�,�`g�&�vwi�P7�	�K���\�X�/�-a>_<Z�c�jmPV���.o��M�h� d�=���9$���pi��;�Y�2!1�ȡ�1�ִx}!!B����,v��-_)�	b]V��@�5% �H�^�B���f��z<y���d��s�nT}^"?�S�I/���I�z6��U@�����F���s�{ݺ�Q55���p|L��;�5��|���w��7����x�Ec,�.9?�x�	�ҕ�������9�m0�͑H��OЌ!�3O�r��y�r^c�UO ��ȕ-�O&��ĚWJ�o(g��ᬃeD�!^$�8�Y�E{� ��BB��wy��i���{�t�$+�@��AI	.�J�Ю�(�����dh�7}��Z7�d�%����6�t:���f�"D��ʷX9x d�!Y�Sh�3,�%@���Dpki8u���8�@
�^x	���������o^y�����Xn ?�x�������6��������n�"G�$ɨ/��Vk�Y`^Y���l�[�c0���#�;�M�$�H�{���.%`i��;����p��Ro��is�	��E,� x�2���JXi}��B
��RT��6_H�~�ᢲ.�,�"� ����jG&*���'�Wݰo�~/`Z��ߣ�D�Z�3��g�
�Y9�4UQbtr���-|��+����7�>\@է�#O�l����D�╦��8S��	��2�Ea,M�U�6�E	����ш�׆Clnnc}}Y���[z�Z��t�w\Ļ�Hh!�'ȼa0#[��[	NV�2���R�=�C�>��BAa��,Q�x�њڥB��@ܨ
�ŒC�ɣ
V;�K�}�R�-�b+�����-qK��S/Q'q��u<��Kx��_�+�#�G�� ���+u]�h�AYP0im=���@�Xn�P�d�Zc<��wq��c2��i<��m�6��T0�Αz�2� �,�X!ix#0���gb�9ko��/��Wz,�����n��X��E���"�y��	wBm�T����yPr�U��g���s�59��f�&���a<���.vo�:�q�<��.J���� �s�s��@��h�w,�4���^�OT)�q��1�Nqzz����\_��)y������Pi�C�*%�F�����	�"��!�����%���)Z\�A3���	A�8�d}{zni#P�+I3�@*B������M"�N2�H\BQD��h4�Xow�Q���V���{CHH��5��H�����y�$Q�ھ���3�~�>_2|�q1��}gՖu����{,��W�	�$iJ��F߻w�|�,���{��{����X`���4��
\*hmPU��V�'{�[h'���I�sVj!���[ċ��x�����PR)�]ta��
�eY{�E����Nw��)�����
eS�1��,��҇&h���Ip6�A�����65�@��&&��X ��J�q�,�Ց�ۋ����	d��+ �$P�K�T�.�@	������>_�|���R˃)����#���F�4t7� ��P��	�3pN������DT�N琂(i���K0�vhC��yU����AX�u�T��s�/E�26N�t��X�joKm7kLlߝ�Qs��Ee�w����i�a8\�n��cq�����.<���%М4�3���"�y$�0g|�!}y�\!��N"��,[*QB�UZH	-HXT7�p�a�hL,�B+O���o�E�4��`4��Q��夬��ۣ�GJ��|3�]��$�N�J��:]��a9�}��	��@#;H
5������2I�v$��=l� B*��Q�V�֑�$��Q�����0�M��p)M��Ƥǅ$�-jd������@�$a�M@.C+*� 8y�[ ���`�PW�s�9�ʨ+�9��3aꚦ����^jS����jk�p�K+����C|��!N'$ݜ�yt�c �Z�H��_n��vG�ʲ@��A
�
�4�J3p)�v:�@5eiw��&��I����O6�v�Nc�R��*��\.��ggi�'�y�>����.#�8k-��̖�� p�>q�mG(u��1�g��0����5w�^�~�ʋ�iJ8�)y�4K�g(+�1�N0>c4:��x��t�蟷@X�8��ʑzV`�,��~�1�U���i��W��Z��ۣNn�%����ׄ�;ʹ��j|�����`%pǨ�fg&i����z�[ܒ������Zkئ������8K'�B@��;��N�$͒1�����H)�h�� ��Ucs����h��K�k�-��4ʃ&b���'�1���I ��E�!��=����$�	�)�T�C8�YUc<�`�,��Ȳ}��0	 ���ך������O���:@��0�p�.�MϦ�sm,�s�yv�d2E�K��h(�'�%���G"N�ܢ��Ќ���C0�;ܫ�r?a��L*��]{�H�㜹���%Mo��+i�s~�d�{�=���Vc�����vi͓��] ��q�����\B�����R�:���-e��y������z6c|�>zi��W�1�NP�{�L�1&�n5����I������;!T���0`p\ ���P7~"��W�]����t L�Ί`�'� {"�{Rn ��9#��f���v��:�b:]����ƜyN�x���g�q�N��C
$*��+�%ڬ}-�T��UY�T}��`2��d���o|󝝽���u�\&|qq� �6��ȥ��������`��L=a_'��Zt6�=v�{��rm;�#[Z!�gO���h'��,��2�͝�u6��k��^x�;^ׂKJ�[{w�v��cu����s��w��t��uџ��@2��u��;��$�hX�7n��.�a2��2�^��/��;���/?.\�K)�;{{�d9��8<<D��C> N!�ʦ-o�g�[�����d8*%
*OH��IrMk�V/�����z�n�~�G�N�D%4Fw�]l�A]�_	̛�X�P��5a~#�c]��d˼� �eg�a#�U��v	�;;$dVW��;y|^k�1LL�@D�ޡ�2���:�6�߻y���|�����%x��~�s���������׿���=lu��J�XրYhx�w�;���	c����\�,���3�$*�����b�6������9�D��Z}����8GS���&gگ�͙�	p�M��έ����)�0���k �$:91�	����n�:��e	�x2G�-d��k/���<w������<(.\�����Q��$�������V)�~�'��v{h���rXG�����S��!�Hъ�K���߰����Q�簍&�ǣ��(%҄>BkԦA�v�A��8袈2ɽ���Ζ/"k,#ʚ�
�n`�L24u�������=;��d�	"+2�*�y��֡��#�:�	"`Q�ѭ��	Z8&�)�D�d�qp� C�a[��w�n�z��&7p ��������K*��T3����}��V�m�;�38�u�8��A)��L�F�Z��`��c�9'�>���2hb�wMD4ea�*�9���ϳ�sg��x~��~�M^���%����B�V9��{��h'�u���9�C�Ӄ�E]������غ����~y�����~��?�l?Ը�	 �ʘ���������ӓ��`k$rʋ�'��$���� �T\�=2+��$
�!�H �&������S�91酀1��.�����p��sF�L��ϡ�"X	�ǇM���ᜑS�_��oH+IT�	���<\�o~��Q$���>o��`@^����N�Al��p�wwp�֭W��[�[�Iqq ��1��/�?:��Y��:�3cPiJ
VR9 ���ı��O@�����ڨ[Ҟ2�]�"_�v�2�N�$	�!��F;�$�ځ ���������(��=A�|:���a��|>C]7`�E���$SQ�MLn�/Z�T� A�(h�?hc��稃s�6MQ��~ ؽ�4�{��_\�����W�K����� й�6�	����UM�m�qg�!�ՠ�]� /�*��h��C�;Jk ����y��p[g�a���ԁ�h��%BqcM�[+����Ɑ��N�d\!Ms�gs������vPMG������ֻ� �n��4!����\�(��KQ��.
�c�Ir�vګ�rIw���1��Q7��!�����W���Zyx2_t\�p��Ώ���OF�����^�p���m��ް`BP����sQuֲsSz �a��].xt�b�c>�&TYX)b���6i�L�qXH��5�Ɛ��t:���ׯ�����o|rr���]`�gX��ei4��&L$*�h<�?�����õ�;x饗��|��W���_ݾ��N��u���Ww�q|tD�Jb�ۣzSqh Bp$\�I+�g�-x��[)E��" b�Te��LhA�9�$����������1/��8�Ϲ��L��[����馄RRW$Xdw�Z�Zz͕��J�sFOM�x~�_��� ,x"Q�
�&�h�X̊Gh���p�瞿S~�k/���y�7���"� �����.t|m�������
���6��:yN�h�,LG���w�-4ƅ��=#��9�T�dJy��W���`4�6𪫂�&"�1"��$�,�=�Յ��v{����t;ԫ��G;��\>��Y�$@�<�<�*j	��O[�N�8���q��.��\�έ�^}� اM�.b������^���{8>��Drܺu[k��
�kk��V{Ū���
����������ż�u�u��1����i�E_v�����A�%t-H���N����з2� Aq��c�Ե��,�"�u^0����C�$B�$�� �H��j�X?��W5��9������G�����+��{r����c����/��t�2U�nVzXYB[�1�]���Rľ1��ܑ�羍ǭ�L�,�~6�QW ��J����u��C�"����|������	�����yY*���0���y�-��G�hw��ܾ���I�<�U���1��s�h4�������ml_���������c�� �W��{�t��ׇ��~���ӓ�+��Uc�h�,K�d	F��1��m`�Ĩ�~x"�z��8dy
Q������7��8��� (o]���$�ȩp��#u�%Y�q���J%	�,���Kd�Z� ��6��W}��z�YA��'�c4�`sm�?�<����_o�\f��]���(�^���7�w��A��E�����Il��g�p�bb�i!����X���eY��8MSt�]�i
c����@7�j��s>���V9�|�/p�����7�*�9XƟ���n*Q�EQ`6�a:�a4�`2��2�4���_�׾���^�}��xLW�s���5��?�e�������އ����}yU]��KIf�R
��rYa-�Y�4�mᶙ��u�$�nhtυ�e$�)����#�#���� -l�����DUI�X�A�yQ�0@��!#z{�g��Դjݠi4�P����t���C�����]<��ܾ}O?�̫OJrOJ���֛k �voܻw��	F�c�t
���`ݜX�Ak)���O �j�E�?n�=����Ykc�AA�u�G}�O}BP�q*9��'���A
.tJ��[��<v�A]7L5Ac4j�D�0�&�ھ��n?�������vN.@<9	 +[onm9���}�[����T"��S$�O����F[�L@J�d�S���	�}��8�V!ɂ'$���;�h���X����?IՍ�6⌠}�AY4m`L!���{u��+�����`k�26�^���*���3��ܾz��?�GQ��Jp X���u��E�������_�0���W.�s	k��w��"ia�n7��Y���̥�,�%T ��M�_�,�����4���	 �=�m�)��;���u��,1+�N��������bgo�?�N��tZ<����ҕ�jJ�Y��Kp ���/����Z��v��/ocrz�b>���ZdY�n�����@U低�8�i���9�/CB!2�O�'
���Sdi�����,[Vy�s0�5�pK�,Kǘ�����3�Y�m���1rc����q���ݻa^��W1ܾ���[';7���A�Y���ē�� ���������p��666~"���7������h�����؃�T�X�v�6��4��s�� p0gaj��n�-�����s	.I�,��HT�$q 9˧�1�@����ƻ;�	���v�3����Z������c|t�.:�n�Y�7_����w�Ս���|���&8 l^�}m���k���{�!�"������@c,F�ʪ���#�@�7�@�a
�fKkQ�S�k[�t��<�$e��8������9�')M4=} �	�9��@��0&�-�<G���3�f��z�e����`u�x�g�w..狎':��a'�����O���o������~+�>���������~��4�tr�y��:I�D�m8� ��̧3h�Pǆ�OM��?��Cx�EY�8==�,�BϦ�U��7���}y2�
o[`mc�o����.��	�<��՝��SJn�I�|ΰ���nv���o����_�'����"�s0��j0���ƣ#$J�;]�(��AI�k�3��yNr�J#��	{Z�Y�A7fE�yQ ����E]!MrE醪j�Ƹ�ʦ�ht�Zk<��������/�������m ?K�ɬ�
���u��^��|k���W���^�^?:�� xo,LӠ�Mptt�����<��01O*Ԇ�JW�Vǥ,�Ne�B�l��(��5�h�K�˗���/�\��Q<�Z���Sk�J7������O�����!����o��N�w~ ���I�� R�}��c� �`�����w|��lg��.����10�"�;���X8)4�^�:t��7+�X���GGX[����=��o}�4�U
�h�	ξϹiksc���z��uٿ��-Du�9�[�ye�O����r2���Z`r:�d++"��I�V���>(�Ô�nj�Zט��DS�888@���<���v���@ށtYUB�ɟ�J�I��âS�qd֨    IEND�B`�R=/�   �L�x��#   res://examples_dd3d/addon_icon.tscn���:^+   res://examples_dd3d/DebugDrawDemoScene.tscn�c[W�l5-   res://examples_dd3d/DebugDrawDemoSceneCS.tscnj	-��b#   res://examples_dd3d/Roboto-Bold.ttf�����/�S!   res://Main/Scenes/main_scene.tscn\�[%   res://Main/Tilesets/Path_tileset.tres�|�w���   res://Ressources/Path.svg�'�&��r    res://Ressources/Path_Arrows.svg�����a   res://Ressources/Skull.png��U�:n   res://icon.svg��=GԻ}"   res://Ressources/Path_Conveyor.svg�S�n$   res://Ressources/Path_Arrows_Dot.svgECFG      application/config/name         MathFactory    application/run/main_scene,      !   res://Main/Scenes/main_scene.tscn      application/config/features(   "         4.1    GL Compatibility        application/boot_splash/bg_color        �?  �?  �?  �?   application/boot_splash/image$         res://Ressources/Skull.png     application/config/icon         res://icon.svg     editor_plugins/enabled8   "      *   res://addons/coi_serviceworker/plugin.cfg   
   input/move�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     �B  �A   global_position      �B  xB   factor       �?   button_index         canceled          pressed          double_click          script         input/zoom_in�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     �B  �@   global_position      �B  @B   factor        @   button_index         canceled          pressed          double_click          script         input/zoom_out�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     �B   A   global_position      �B  TB   factor       �?   button_index         canceled          pressed          double_click          script         input/place�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     �B  �@   global_position      �B  @B   factor       �?   button_index         canceled          pressed          double_click          script         input/remove�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     C  A   global_position       C  PB   factor       �?   button_index         canceled          pressed          double_click          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color      ��7?��7?��7?  �?J�	