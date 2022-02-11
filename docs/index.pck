GDPC                                                                                <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex��      U      -��`�0��x�5�[D   res://.import/label.png-469c7bce7a87082ee2b42119739d33e8.s3tc.stex  p     \      +D{�����=2�p�+�@   res://.import/polycat.dae-f28fcc334d2a37fb76075ae67aab8d2a.scn  �      �>      ��9��c��ϐꁎ   res://World.tscn�      	      fz��h�3Z�朚��   res://assets/Tile.tscn               �̤=v����m�]�x   res://assets/block.meshlib         b      a.@��XS5�@C�)`*�    res://assets/polycat.dae.import @[      9|      U;�Bp3ys^�bˣ�   res://camera/Camera.gd.remap0     (       ���̶NE���|B~   res://camera/Camera.gdc ��            ������v�iW�Y�   res://camera/Camera.tscn��      �       ���#_�MW@�'AU�8   res://default_env.tres  0�      �       um�`�N��<*ỳ�8$   res://enums/DirectionEnum.gd.remap  `     .       �{RY��
�4��e#|    res://enums/DirectionEnum.gdc   ��      �       ��[�K�"0m`c��O   res://icon.png         �      G1?��z�c��vN��   res://icon.png.import   �      �      �����%��(#AB�    res://managers/Signals.gd.remap �     +       l�ӽ�	����m�ߺ   res://managers/Signals.gdc  ��      c       G>�u?+J9Q�[���   res://player/Player.gd.remap�     (       ����]{�ZNJD��l�   res://player/Player.gdc  �      *      .�2��6Mf���Sh�   res://player/Player.tscn0�      �      &;� �i �
�y/��P"    res://powerups/DoubleJump.tscn  ��      N      ��(Uf���eʗ,�    res://powerups/Powerup.gd.remap �     +       ����[n��sZ-�	    res://powerups/Powerup.gdc  0     4      �n�����@sfz�h*�    res://powerups/label.png.import �     V      �ȁwޡ��ry�z-   res://project.binary-     	      |��e��+lY$����o        [gd_scene load_steps=5 format=2]

[ext_resource path="res://assets/block.meshlib" type="MeshLibrary" id=1]
[ext_resource path="res://player/Player.tscn" type="PackedScene" id=2]
[ext_resource path="res://camera/Camera.tscn" type="PackedScene" id=3]
[ext_resource path="res://powerups/DoubleJump.tscn" type="PackedScene" id=4]

[node name="World" type="Spatial"]

[node name="Camera" parent="." instance=ExtResource( 3 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 6 )
offset = Vector3( 0, 1.3, 6 )

[node name="Player" parent="." instance=ExtResource( 2 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -2.2518, 0 )

[node name="DoubleJump" parent="." instance=ExtResource( 4 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 31.1925, 0.834666, 0 )

[node name="GridMap" type="GridMap" parent="."]
mesh_library = ExtResource( 1 )
cell_size = Vector3( 1, 1, 1 )
cell_center_z = false
data = {
"cells": PoolIntArray( 34, 0, 0, 65526, 0, 0, 65527, 0, 0, 65570, 0, 0, 131062, 0, 0, 131106, 0, 0, 196598, 0, 0, 196642, 0, 0, 262133, 0, 0, 262134, 0, 0, 262178, 0, 0, 327668, 0, 0, 327669, 0, 0, 327670, 0, 0, 327714, 0, 0, 393204, 0, 0, 393250, 0, 0, 458740, 0, 0, 458752, 0, 0, 458753, 0, 0, 458754, 0, 0, 458755, 0, 0, 458756, 0, 0, 458757, 0, 0, 458758, 0, 0, 458759, 0, 0, 458760, 0, 0, 458761, 0, 0, 458762, 0, 0, 458775, 0, 0, 458776, 0, 0, 458777, 0, 0, 458778, 0, 0, 458779, 0, 0, 458780, 0, 0, 458781, 0, 0, 458782, 0, 0, 458783, 0, 0, 458786, 0, 0, 524276, 0, 0, 524282, 0, 0, 524283, 0, 0, 524284, 0, 0, 524285, 0, 0, 524286, 0, 0, 524287, 0, 0, 524322, 0, 0, 589812, 0, 0, 589858, 0, 0, 655348, 0, 0, 655394, 0, 0, 720884, 0, 0, 720930, 0, 0, 786420, 0, 0, 786466, 0, 0, 851956, 0, 0, 852002, 0, 0, 917492, 0, 0, 917538, 0, 0, 983028, 0, 0, -589815, 0, 0, -589814, 0, 0, -589813, 0, 0, -589812, 0, 0, -589811, 0, 0, -589810, 0, 0, -589809, 0, 0, -589808, 0, 0, -589807, 0, 0, -589806, 0, 0, -589805, 0, 0, -589804, 0, 0, -589803, 0, 0, -589802, 0, 0, -589801, 0, 0, -524280, 0, 0, -524265, 0, 0, -458745, 0, 0, -458729, 0, 0, -393210, 0, 0, -393205, 0, 0, -393204, 0, 0, -393193, 0, 0, -327675, 0, 0, -327670, 0, 0, -327669, 0, 0, -327668, 0, 0, -327657, 0, 0, -262144, 0, 0, -262143, 0, 0, -262142, 0, 0, -262141, 0, 0, -262140, 0, 0, -262139, 0, 0, -262135, 0, 0, -262134, 0, 0, -262133, 0, 0, -262132, 0, 0, -262121, 0, 0, -196618, 0, 0, -196617, 0, 0, -196616, 0, 0, -196615, 0, 0, -196614, 0, 0, -196613, 0, 0, -196612, 0, 0, -196611, 0, 0, -196610, 0, 0, -196609, 0, 0, -196601, 0, 0, -196600, 0, 0, -196599, 0, 0, -196598, 0, 0, -196597, 0, 0, -196596, 0, 0, -196585, 0, 0, -131082, 0, 0, -131081, 0, 0, -131080, 0, 0, -131079, 0, 0, -131078, 0, 0, -131064, 0, 0, -131063, 0, 0, -131062, 0, 0, -131061, 0, 0, -131060, 0, 0, -131049, 0, 0, -65546, 0, 0, -65545, 0, 0, -65544, 0, 0, -65543, 0, 0, -65527, 0, 0, -65526, 0, 0, -65525, 0, 0, -65524, 0, 0, -65523, 0, 0, -65522, 0, 0, -65521, 0, 0, -65513, 0, 0, -65512, 0, 0, -65511, 0, 0, -65510, 0, 0, -65509, 0, 0, -65508, 0, 0, -65507, 0, 0, -65506, 0, 0, -65505, 0, 0, -65504, 0, 0, -65503, 0, 0, -65502, 0, 0, -10, 0, 0, -9, 0, 0, -8, 0, 0 )
}
__meta__ = {
"_editor_clip_": 0,
"_editor_floor_": Vector3( 0, 0, 0 )
}

[node name="DirectionalLight" type="DirectionalLight" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 7.36068 )
       [gd_scene load_steps=3 format=2]

[sub_resource type="CubeMesh" id=1]
size = Vector3( 1, 1, 1 )

[sub_resource type="ConcavePolygonShape" id=2]
data = PoolVector3Array( -0.5, 0.5, 0.5, 0.5, 0.5, 0.5, -0.5, -0.5, 0.5, 0.5, 0.5, 0.5, 0.5, -0.5, 0.5, -0.5, -0.5, 0.5, 0.5, 0.5, -0.5, -0.5, 0.5, -0.5, 0.5, -0.5, -0.5, -0.5, 0.5, -0.5, -0.5, -0.5, -0.5, 0.5, -0.5, -0.5, 0.5, 0.5, 0.5, 0.5, 0.5, -0.5, 0.5, -0.5, 0.5, 0.5, 0.5, -0.5, 0.5, -0.5, -0.5, 0.5, -0.5, 0.5, -0.5, 0.5, -0.5, -0.5, 0.5, 0.5, -0.5, -0.5, -0.5, -0.5, 0.5, 0.5, -0.5, -0.5, 0.5, -0.5, -0.5, -0.5, 0.5, 0.5, 0.5, -0.5, 0.5, 0.5, 0.5, 0.5, -0.5, -0.5, 0.5, 0.5, -0.5, 0.5, -0.5, 0.5, 0.5, -0.5, -0.5, -0.5, 0.5, 0.5, -0.5, 0.5, -0.5, -0.5, -0.5, 0.5, -0.5, 0.5, 0.5, -0.5, -0.5, -0.5, -0.5, -0.5 )

[node name="Tile" type="Spatial"]

[node name="Block" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = null

[node name="StaticBody" type="StaticBody" parent="Block"]

[node name="CollisionShape" type="CollisionShape" parent="Block/StaticBody"]
shape = SubResource( 2 )
 RSCC      +F  K  �   0   q   �   (�/�`  v�J7PO�03333�����,�j`	��c���M�$[.����p�	�.(�G����A�S7 9 B O���r\��?�K�+m
����0�����-��U��LL�ciUt^o�p(j\X����!�L	�~����w��R�M�&!Ge�K�ev5��o�e�afq�?��*�$�,�_��E5�_�]8�[��ۭIr1��8����5$�E���g#|Dx�=�uu�/�N�L�z[�!i+�!����������sbPxCm�[B���!AC��(R"��[�_��{��}T������ ��	����ɑ�����T������CH1C��b%F"	%�z8Ghd�S�&�%XW)��	xIwaJ����䢉+�`�����]S%@�1�� &i�������=W'�Lr�K@n�J���jr���+Η�E��D��+Z(����ǯ�2̉�!�"̓�{E�����W7��B+��Qk��a�����.ﭐ(���2��J�s�^d�P�����@/�)���d�6���?���S$�ؾ������nW��2���3�HAU��S�Vho��2(�/�`  h���� ����rrr�V��:����0D/��*�HX8B�)�����׭qh��Cl[�j�Gʕֲe�먍����#��E�A�������־��#ҹ��=��9��u �?uק\����(�/�` 5 `���� rrr���� I��``)X"�:�}��h(�/�` = `���� rrr����' P�$Q7
!H��0ԥ���<�L
����yBj�LR��`��C+Sp8��) B4�S �69����EA�a��TP�БE�(�/�`+� �%�MZ30`Gb$���@4GW�2�� R  �ۘ�b�z8��|q��G�T�'4�u�N�#j�*�
+���v�Q�a��Q~Ȳ�tw% ���̎��,;��s�**dȿ ��!n%�����$���֘7@ � d �A��l�pP�7Yx
)>�L"/UXRSCC              RSRC                    PackedScene                                                                 <   	   Armature 	   Skeleton    body    head    leg.l    leg.r    tail    resource_local_to_scene    resource_name    lightmap_size_hint    blend_shape_mode    custom_aabb    surfaces/0    script    length    loop    step    tracks/0/type    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/imported    tracks/0/enabled    tracks/0/keys    tracks/1/type    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/imported    tracks/1/enabled    tracks/1/keys    tracks/2/type    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/imported    tracks/2/enabled    tracks/2/keys    tracks/3/type    tracks/3/path    tracks/3/interp    tracks/3/loop_wrap    tracks/3/imported    tracks/3/enabled    tracks/3/keys    tracks/4/type    tracks/4/path    tracks/4/interp    tracks/4/loop_wrap    tracks/4/imported    tracks/4/enabled    tracks/4/keys    tracks/5/type    tracks/5/path    tracks/5/interp    tracks/5/loop_wrap    tracks/5/imported    tracks/5/enabled    tracks/5/keys 	   _bundled        
   local://1 !      
   local://2 �      
   local://3 �#      
   local://4 |*      
   local://5 �7      
   ArrayMesh             Cone       	         array_data    �
  �?zH�y�?>O�     ��      �XĻzH�E9��O�     ��      �XĻ���?��=O�    ��      �Rx��;?�aſ?�    ��    :�H͘>��?�    ��      "	#��8h?(,��?�    ��      �XĻ���?��=��    ��      �XĻzH�E9����     ��      8�zH�y�?>��     ��      �?zH�y�?> ~     ��      �XĻ���?��= ~    ��      8�zH�y�?> ~     ��      �XĻzH�E9�� �      ��      �?zH�y�?> �      ��      8�zH�y�?> �      ��      "	#��8h?(,��(aF    ��      �XĻzH�E9��(aF     ��      �Rx��;?�aſ(aF    ��    �XĻzH�E9��c��     ��      :�H͘>��c��    ��      �Rx��;?�aſc��    ��    :�H͘>�濌�    ��      �XĻzH�E9����     ��      "	#��8h?(,����    ��      ��b> �轄�>� �    ��      �[�>�D½�2�=� �    ��      =��>�_|��T�=� �    ��      �[�>�D½�2�=�w%    ��      ��b> �轄�>�w%    ��      ;	�>˽m>�w%    ��      =��>�_|��T�=L�    ��      �[�>�D½�2�=L�    ��      ;	�>˽m>L�    ��      ��b> �轄�>��|    ��      =��>�_|��T�=��|    ��      ;	�>˽m>��|    ��      �XĻ���?��=      ��      �l@?�@��=      bԜ+    X�;��@���=      ��6    �0v?�{�?(H�<�{    |ق&    �l@?�@��=�{    bԜ+    �XĻ���?��=�{    ��      �|?z\@��=�z    ��f-    �l@?�@��=�z    bԜ+    �0v?�{�?(H�<�z    |ق&    �XĻ���?��=��{    ��      X�;��@���=��{    ��6    	pq��{�?�F�<��{    ��#/    X�;��@���=��z    ��6    E�w�z\@��=��z    ��Y8    	pq��{�?�F�<��z    ��#/    X�;��@���=      ��6    �l@?�@��=      bԜ+    H��>�@Vҹ�      ��S    '���@�ҹ�      3��    H��>�@Vҹ� Ҋ    ��S    �XĻ���?��= Ҋ    ��      '���@�ҹ� Ҋ    3��    �0v?�{�?(H�< ы    |ق&    �XĻ���?��= ы    ��      H��>�@Vҹ� ы    ��S    �XĻ���?��= ы    ��      	pq��{�?�F�< ы    ��#/    '���@�ҹ� ы    3��    E�w�z\@��=hH     ��Y8    X�;��@���=hH     ��6    X�;��@"r�hH     ��f5    	pq��{�?�F�<��    ��#/    E�w�z\@��=��    ��Y8    X�;��@"r���    ��f5    '���@�ҹ���    3��    	pq��{�?�F�<��    ��#/    X�;��@"r���    ��f5    X�;��@���=      ��6    '���@�ҹ�      3��    X�;��@"r�      ��f5    �l@?�@��=�H     bԜ+    �|?z\@��=�H     ��f-    �l@?�@�r��H     ��',    H��>�@Vҹ�      ��S    �l@?�@��=      bԜ+    �l@?�@�r�      ��',    �|?z\@��=,�    ��f-    �0v?�{�?(H�<,�    |ق&    �l@?�@�r�,�    ��',    H��>�@Vҹ��    ��S    �l@?�@�r��    ��',    �0v?�{�?(H�<�    |ق&    %��� �轄�>��    ��      汏��D½�2�=��    ��      �p���_|��T�=��    ��      汏��D½�2�=�w%    ��      %��� �轄�>�w%    ��      aR�˽m>�w%    ��      �p���_|��T�=L�    ��      汏��D½�2�=L�    ��      aR�˽m>L�    ��      %��� �轄�>��|    ��      �p���_|��T�=��|    ��      aR�˽m>��|    ��            vertex_count    d         array_index_data    �             	  
                       ! # " $ & % ' ) ( * , + - / . 0 2 1 3 5 4 3 6 5 7 9 8 : < ; = ? > @ B A C E D F H G I K J L N M O Q P R T S U W V X Z Y [ ] \ ^ ` _ a c b       index_count    f      
   primitive             format    �}       aabb    E�w��_|��濒T�?^t]@���?      skeleton_aabb          E�w�zH��aſ�T�?�*@|`�?   E�w����?�ҹ��T�?�^?b�T>   ��b>�_|��T�=�?>�d?>��=   %����_|��T�=�?>�d?[��=   "	#�H͘>�濚�?>�?�g�>      blend_shape_data        
   Animation ,            idle         �@      
   transform                                                     !            �?�r����> ��:              �?�P�>�P�>�P�>  �@  �?�r����> ��:              �?�P�>�P�>�P�>      
   transform                                                          !            �? ���f+�� ����          �? �? �? �?  �@  �? ���f+�� ����          �? �? �? �?      
   transform                    !         "         #         $         %   !           �?  @(  @�  �41�&��5ݘ>��o?��?��?��?���>  �?  @(  @�  �41�&��5ݘ>��o?��?��?��?���>  �?  @(  @�  �43('����6
�>�ep?��?��?��?���>  �?  @(  @�  �4�(����bA�>I�q?��?��?��?��?  �?  @(  @�  �4�W)��g��Z��>|�s?��?��?��?��?  �?  @(  @�  �4��*��Fb��b\>��u?��?��?��?��L?  �?  @(  @�  �4�/��j�?�d=V�{?��?��?��?  �?  �?  @(  @�  �4�5.��w�<F]�l�z?��?��?��?���?  �?  @(  @�  �4�3-�F�=��y?��?��?��?�?  �?  @(  @�  �4u9,��1@=
1;�Z�w?��?��?��?���?  �?  @(  @�  �4g+��T=�oO�̣v?��?��?��?$"�?  �?  @(  @�  �4�$+�L_^=��X��!v?��?��?��?���?  �?  @(  @�  �4J+�O�_=#�Y�~v?��?��?��?��@  �?  @(  @�  �4��*�wH_=��Y��v?��?��?��?��@  �?  @(  @�  �4�<$��Y=o3Z�4Zv?��?��?��?@  �?  @(  @�  �4�^�Y�J=H[��w?��?��?��?WU@  �?  @(  @�  �4����3=U\���w?��?��?��?#""@  �?  @(  @�  �4�vԼ]۽<J�_���y?��?��?��?gf&@  �?  @(  @�  �4�}����<J`�_�y?��?��?��?��*@  �?  @(  @�  �4R��;��<oL`�o�y?��?��?��?��.@  �?  @(  @�  �4U<J~<�G_�I�y?��?��?��?333@  �?  @(  @�  �4�<��<�{W��8z?��?��?��?ww7@  �?  @(  @�  �4He�;���<�>F�){?��?��?��?��;@  �?  @(  @�  �4�S;���<�j+��M|?��?��?��?��?@  �?  @(  @�  �49�e�i3=����}?��?��?��?��L@  �?  @(  @�  �4���q=<�~<Cy?��?��?��?��Y@  �?  @(  @�  �4��.��=�#2>�z?��?��?��?��]@  �?  @(  @�  �4AbM�2�=�%]>�xx?��?��?��?"b@  �?  @(  @�  �4��i�Z��=�>)v?��?��?��?cff@  �?  @(  @�  �4�;��P��=�F�>6<t?��?��?��?��j@  �?  @(  @�  �4�w���$�=�z�>��r?��?��?��?��n@  �?  @(  @�  �4n���MI�=�>�1r?��?��?��?/3s@  �?  @(  @�  �4�U���.�=PM�>�r?��?��?��?sww@  �?  @(  @�  �4����Ei�=o��>��q?��?��?��?��{@  �?  @(  @�  �4�˻����=��>��q?��?��?��?��@  �?  @(  @�  �4�vȽҭ�=&��>a�q?��?��?��? "�@  �?  @(  @�  �4Ȫսb��=70�>��q?��?��?��?df�@  �?  @(  @�  �4k��3�e=���>��q?��?��?��?�̌@  �?  @(  @�  �4�����<���>��q?��?��?��?RU�@  �?  @(  @�  �4i���MD��P�>�p?��?��?��?tw�@  �?  @(  @�  �4��!�a�m�j,�>�rp?��?��?��?���@  �?  @(  @�  �4 $�W�����>�;p?��?��?��?���@  �?  @(  @�  �4�%�a����>mp?��?��?��?�ݝ@  �?  @(  @�  �4�&��b���>'�o?��?��?��?  �@  �?  @(  @�  �41�&��5ݘ>��o?��?��?��?&      
   transform '                  (         )         *         +         ,   !            �?  �3  @�  �� �� �  ��  �?��?��?��?  �@  �?  �3  @�  �� �� �  ��  �?��?��?��?-      
   transform .                  /         0         1         2         3   !            �?  ��   �  ��  � �0 ��  �?��?��?��?  �@  �?  ��   �  ��  � �0 ��  �?��?��?��?4      
   transform 5                  6         7         8         9         :   !   ,        �?  ��  ��  �3 �'  � @�  �?��?��?��?���=  �?  ��  ��  �3���&��2�:��?��?��?��?��>  �?  ��  ��  �3j���0���g�;��?��?��?��?��L>  �?  ��  ��  �3�;�(;���<��?��?��?��?���>  �?  ��  ��  �3A�㻦P�����<��?��?��?��?���>  �?  ��  ��  �3��1���ڼ8[�<��?��?��?��?��?  �?  ��  ��  �33���ȇ=S�~?��?��?��?��n?  �?  ��  ��  �3�ʡ�DXG��@>5�u?��?��?��?���?  �?  ��  ��  �3����(����>��c?��?��?��?HD�?  �?  ��  ��  �3�T�\K���$�>34\?��?��?��?���?  �?  ��  ��  �3���%���QY�>�MZ?��?��?��?ZU�?  �?  ��  ��  �3]��>��~��>��X?��?��?��?���?  �?  ��  ��  �3���r��S�>��W?��?��?��?lf�?  �?  ��  ��  �3���񿾂d�>��V?��?��?��?���?  �?  ��  ��  �3�=� �����>*�V?��?��?��?~w�?  �?  ��  ��  �3(��f��	ֹ>��V?��?��?��?  @  �?  ��  ��  �3���Q����k�>\�V?��?��?��?GD@  �?  ��  ��  �3G*��-�����>�UW?  �?��?��?��@  �?  ��  ��  �3�D�����>�W?��?��?��?��@  �?  ��  ��  �3}�ҟ��D0�>��X?��?��?��?WU@  �?  ��  ��  �3�������ld�>�HZ?��?��?��?��L@  �?  ��  ��  �3�ʽȞy�qq>��o?��?��?��?/3s@  �?  ��  ��  �3iL��j�����=��{?��?��?��?�ݝ@  �?  ��  ��  �3+/��׹�:�9��?��?��?��?  �@  �?  ��  ��  �3 �'  � @�  �?��?��?��?
   Animation ,            jump         �>      
   transform                                                     !            �?�r����> ��:              �?�P�>�P�>�P�>  �>  �?�r����> ��:              �?�P�>�P�>�P�>      
   transform                                                          !            �? ���f+�� ����          �? �? �? �?  �>  �? ���f+�� ����          �? �? �? �?      
   transform                    !         "         #         $         %   !            �?  @(  @�  �4  2 �' l(  �?��?��?��?  �>  �?  @(  @�  �4  2 �' l(  �?��?��?��?&      
   transform '                  (         )         *         +         ,   !   <         �?  �3  @�  �� �� �  ��  �?��?��?��?���=  �?  �3  @�  ��U��<��L=J�<k�?��?��?��?��>  �?  �3  @�  ��fE�=�J'>��<cp{?��?��?��?��L>  �?  �3  @�  ��>N��>)�D=��s?��?��?��?  �>  �?  �3  @�  ��S!>�u�>��X=�"q?��?��?��?-      
   transform .                  /         0         1         2         3   !   <         �?  ��   �  ��  � �0 ��  �?��?��?��?���=  �?  ��   �  ����<T(\�d��	�?  �?��?��?��>  �?  ��   �  �����=j�3�
Y���{?��?��?��?��L>  �?  ��   �  ���>Z���7�I�"�r?��?��?��?  �>  �?  ��   �  ��>3w��f�^�r�o?��?��?��?4      
   transform 5                  6         7         8         9         :   !   <         �?  ��  ��  �3 �'  � @�  �?��?��?��?���=  �?  ��  ��  �3owȽ�N=�A�@F~?��?��?��?��>  �?  ��  ��  �3:(���>+>.���vWl?��?��?��?��L>  �?  ��  ��  �3%G�zD�>X�@�:KL?��?��?��?  �>  �?  ��  ��  �3a�ݵ�>�Q�k�A?��?��?��?
   Animation ,            walk          ?      
   transform                                                     !            �?�r����> ��:              �?�P�>�P�>�P�>   ?  �?�r����> ��:              �?�P�>�P�>�P�>      
   transform                                                          !   �         �? ��a2,��M3����          �? �? �? �?���=  �? ���޻-0����3          �? �? �? �?��>  �? ���e���������3          �? �? �? �?��L>  �? ��h���
����3          �? �? �? �?���>  �? ��q=��P����3          �? �? �? �?���>  �? ��yb������          �? �? �? �?���>  �? ���B�3�J����3          �? �? �? �?���>  �? ��~��
����3          �? �? �? �?��?  �? ����G�����3          �? �? �? �?��?  �? ��a2,��M3����          �? �? �? �?   ?  �? ��a2,��M3����          �? �? �? �?      
   transform                    !         "         #         $         %   !   x         �?  @(  @�  �4���2�����i�=\`?��?��?��?���=  �?  �(  ��   53��2jY���SU=�?��?��?��?��L>  �?  @(  @�   5l�2DbJ;�}���?��?��?��?���>  �?  @(  @�  �4��1O�;����7q?��?��?��?���>  �?  @(  @�   5�*2Pc�;Q����{?��?��?��?���>  �?  �(  ��   5y/2�5;�����?��?��?��?���>  �?   (   �  �4o�91,;㺕�<>�?��?��?��?��?  �?  �(  ��   5+?�2㵚���s=�?��?��?��?��?  �?  @(  @�  �4���2�����i�=\`?��?��?��?   ?  �?  @(  @�  �4���2�����i�=\`?��?��?��?&      
   transform '                  (         )         *         +         ,   !   �         �?  �3  @�  ����þ�}�7�+�^�l?��?��?��?���=  �?  �3  @�  ��.&����O7#P�j�t?��?��?��?��>  �?  �3  @�  ��F-k���J68���ӓ?��?��?��?��L>  �?  �3  @�  ��O f>�=����;�ry?��?��?��?���>  �?  �3  @�  ��0��>�e���<�`n?��?��?��?���>  �?  �3  @�  ���h�>֍]��/<C�o?��?��?��?���>  �?  �3  @�  ���\$>�P��:�};ǭ|?��?��?��?���>  �?  �3  @�  ���2�i��6��J���}?��?��?��?��?  �?  �3  @�  �������3i7���Wq?��?��?��?��?  �?  �3  @�  ����þ�}�7�+�^�l?��?��?��?   ?  �?  �3  @�  ����þ�}�7�+�^�l?��?��?��?-      
   transform .                  /         0         1         2         3   !   �         �?  ��   �  ����>�6��}�^�l?��?��?��?���=  �?  ��   �  �����>�]i��Ȼs�t?��?��?��?��>  �?  ��   �  @���j=%�5����ԓ?��?��?��?��L>  �?  ��   �  ����e���1<�ؘ;�ry?��?��?��?���>  �?  ��   �  ���j����<���;�`n?��?��?��?���>  �?  ��   �  ��]6��+G�<Ģ�;D�o?��?��?��?���>  �?  ��   �  @��.$�-��;�YZ;ɭ|?��?��?��?���>  �?  ��   �  ��>��ʻ�1.���}?��?��?��?��?  �?  ��   �  ��ǉ�>�˃����Wq?��?��?��?��?  �?  ��   �  ����>�6��}�^�l?��?��?��?   ?  �?  ��   �  ����>�6��}�^�l?��?��?��?4      
   transform 5                  6         7         8         9         :   !   �         �?  ��  ��  �3�ބ=4_�=c��~?��?��?��?���=  �?  ��  ��  �3r��<�=iD����?��?��?��?��>  �?  ��  ��  �3>��D��*�k=��}?��?��?��?��L>  �?  ��  ��  �3c�2�0m��>�r?��?��?��?���>  �?  ��  ��   4�Qj������8H>�ig?��?��?��?���>  �?  ��  ��   4�[e��9����C>h?��?��?��?���>  �?  ��  ��  �3���2L�[>F�u?��?��?��?���>  �?  ��  ��  �3<�#���Y�9=H?��?��?��?��?  �?  ��  ��   4H92=l�l=NJ��&?��?��?��?��?  �?  ��  ��  �3�ބ=4_�=c��~?��?��?��?   ?  �?  ��  ��  �3�ބ=4_�=c��~?��?��?��?   PackedScene    ;      	         names "   &      polycat    Spatial 	   Armature 
   transform 	   Skeleton    bones/0/name    bones/0/parent    bones/0/rest    bones/0/enabled    bones/0/bound_children    bones/1/name    bones/1/parent    bones/1/rest    bones/1/enabled    bones/1/bound_children    bones/2/name    bones/2/parent    bones/2/rest    bones/2/enabled    bones/2/bound_children    bones/3/name    bones/3/parent    bones/3/rest    bones/3/enabled    bones/3/bound_children    bones/4/name    bones/4/parent    bones/4/rest    bones/4/enabled    bones/4/bound_children    Cone    mesh    material/0    MeshInstance    AnimationPlayer    anims/idle    anims/jump    anims/walk    	   variants          �P�>            �P�>            �P�>�r����> ��:      body    ����   ��?       �    �iu�@��   �@�?�iu�  �0   �  ��                   head            �?  �4��&�}��}?(�>(�3)���}?    �L�1��ο      leg.l    ��`8J�ż&�:ϊ?�Vu�z �<ku�Hw�]�>�>B?>      leg.r    ���
�E=��<l@=�<?2Z{�ˮ��.w�bv���ƾ��>\C0>      tail    �.X?��޾h�>ī`��z?��[?'e�� >�0&�>������پ# >                                                 node_count             nodes     a   ��������       ����                      ����                           ����                           	      
                                 	            
                                                                                      !      ����                            "   "   ����   #      $      %                conn_count              conns               node_paths              editable_instances              version       RSRC        [remap]

importer="scene"
type="PackedScene"
path="res://.import/polycat.dae-f28fcc334d2a37fb76075ae67aab8d2a.scn"

[deps]

source_file="res://assets/polycat.dae"
dest_files=[ "res://.import/polycat.dae-f28fcc334d2a37fb76075ae67aab8d2a.scn" ]

[params]

nodes/root_type="Spatial"
nodes/root_name="Scene Root"
nodes/root_scale=1.0
nodes/custom_script=""
nodes/storage=0
nodes/use_legacy_names=false
materials/location=1
materials/storage=1
materials/keep_on_reimport=true
meshes/compress=true
meshes/ensure_tangents=true
meshes/storage=0
meshes/light_baking=0
meshes/lightmap_texel_size=0.1
skins/use_named_skins=true
external_files/store_in_subdir=false
animation/import=true
animation/fps=15
animation/filter_script=""
animation/storage=false
animation/keep_custom_tracks=false
animation/optimizer/enabled=true
animation/optimizer/max_linear_error=0.05
animation/optimizer/max_angular_error=0.01
animation/optimizer/max_angle=22
animation/optimizer/remove_unused_tracks=true
animation/clips/amount=0
animation/clip_1/name=""
animation/clip_1/start_frame=0
animation/clip_1/end_frame=0
animation/clip_1/loops=false
animation/clip_2/name=""
animation/clip_2/start_frame=0
animation/clip_2/end_frame=0
animation/clip_2/loops=false
animation/clip_3/name=""
animation/clip_3/start_frame=0
animation/clip_3/end_frame=0
animation/clip_3/loops=false
animation/clip_4/name=""
animation/clip_4/start_frame=0
animation/clip_4/end_frame=0
animation/clip_4/loops=false
animation/clip_5/name=""
animation/clip_5/start_frame=0
animation/clip_5/end_frame=0
animation/clip_5/loops=false
animation/clip_6/name=""
animation/clip_6/start_frame=0
animation/clip_6/end_frame=0
animation/clip_6/loops=false
animation/clip_7/name=""
animation/clip_7/start_frame=0
animation/clip_7/end_frame=0
animation/clip_7/loops=false
animation/clip_8/name=""
animation/clip_8/start_frame=0
animation/clip_8/end_frame=0
animation/clip_8/loops=false
animation/clip_9/name=""
animation/clip_9/start_frame=0
animation/clip_9/end_frame=0
animation/clip_9/loops=false
animation/clip_10/name=""
animation/clip_10/start_frame=0
animation/clip_10/end_frame=0
animation/clip_10/loops=false
animation/clip_11/name=""
animation/clip_11/start_frame=0
animation/clip_11/end_frame=0
animation/clip_11/loops=false
animation/clip_12/name=""
animation/clip_12/start_frame=0
animation/clip_12/end_frame=0
animation/clip_12/loops=false
animation/clip_13/name=""
animation/clip_13/start_frame=0
animation/clip_13/end_frame=0
animation/clip_13/loops=false
animation/clip_14/name=""
animation/clip_14/start_frame=0
animation/clip_14/end_frame=0
animation/clip_14/loops=false
animation/clip_15/name=""
animation/clip_15/start_frame=0
animation/clip_15/end_frame=0
animation/clip_15/loops=false
animation/clip_16/name=""
animation/clip_16/start_frame=0
animation/clip_16/end_frame=0
animation/clip_16/loops=false
animation/clip_17/name=""
animation/clip_17/start_frame=0
animation/clip_17/end_frame=0
animation/clip_17/loops=false
animation/clip_18/name=""
animation/clip_18/start_frame=0
animation/clip_18/end_frame=0
animation/clip_18/loops=false
animation/clip_19/name=""
animation/clip_19/start_frame=0
animation/clip_19/end_frame=0
animation/clip_19/loops=false
animation/clip_20/name=""
animation/clip_20/start_frame=0
animation/clip_20/end_frame=0
animation/clip_20/loops=false
animation/clip_21/name=""
animation/clip_21/start_frame=0
animation/clip_21/end_frame=0
animation/clip_21/loops=false
animation/clip_22/name=""
animation/clip_22/start_frame=0
animation/clip_22/end_frame=0
animation/clip_22/loops=false
animation/clip_23/name=""
animation/clip_23/start_frame=0
animation/clip_23/end_frame=0
animation/clip_23/loops=false
animation/clip_24/name=""
animation/clip_24/start_frame=0
animation/clip_24/end_frame=0
animation/clip_24/loops=false
animation/clip_25/name=""
animation/clip_25/start_frame=0
animation/clip_25/end_frame=0
animation/clip_25/loops=false
animation/clip_26/name=""
animation/clip_26/start_frame=0
animation/clip_26/end_frame=0
animation/clip_26/loops=false
animation/clip_27/name=""
animation/clip_27/start_frame=0
animation/clip_27/end_frame=0
animation/clip_27/loops=false
animation/clip_28/name=""
animation/clip_28/start_frame=0
animation/clip_28/end_frame=0
animation/clip_28/loops=false
animation/clip_29/name=""
animation/clip_29/start_frame=0
animation/clip_29/end_frame=0
animation/clip_29/loops=false
animation/clip_30/name=""
animation/clip_30/start_frame=0
animation/clip_30/end_frame=0
animation/clip_30/loops=false
animation/clip_31/name=""
animation/clip_31/start_frame=0
animation/clip_31/end_frame=0
animation/clip_31/loops=false
animation/clip_32/name=""
animation/clip_32/start_frame=0
animation/clip_32/end_frame=0
animation/clip_32/loops=false
animation/clip_33/name=""
animation/clip_33/start_frame=0
animation/clip_33/end_frame=0
animation/clip_33/loops=false
animation/clip_34/name=""
animation/clip_34/start_frame=0
animation/clip_34/end_frame=0
animation/clip_34/loops=false
animation/clip_35/name=""
animation/clip_35/start_frame=0
animation/clip_35/end_frame=0
animation/clip_35/loops=false
animation/clip_36/name=""
animation/clip_36/start_frame=0
animation/clip_36/end_frame=0
animation/clip_36/loops=false
animation/clip_37/name=""
animation/clip_37/start_frame=0
animation/clip_37/end_frame=0
animation/clip_37/loops=false
animation/clip_38/name=""
animation/clip_38/start_frame=0
animation/clip_38/end_frame=0
animation/clip_38/loops=false
animation/clip_39/name=""
animation/clip_39/start_frame=0
animation/clip_39/end_frame=0
animation/clip_39/loops=false
animation/clip_40/name=""
animation/clip_40/start_frame=0
animation/clip_40/end_frame=0
animation/clip_40/loops=false
animation/clip_41/name=""
animation/clip_41/start_frame=0
animation/clip_41/end_frame=0
animation/clip_41/loops=false
animation/clip_42/name=""
animation/clip_42/start_frame=0
animation/clip_42/end_frame=0
animation/clip_42/loops=false
animation/clip_43/name=""
animation/clip_43/start_frame=0
animation/clip_43/end_frame=0
animation/clip_43/loops=false
animation/clip_44/name=""
animation/clip_44/start_frame=0
animation/clip_44/end_frame=0
animation/clip_44/loops=false
animation/clip_45/name=""
animation/clip_45/start_frame=0
animation/clip_45/end_frame=0
animation/clip_45/loops=false
animation/clip_46/name=""
animation/clip_46/start_frame=0
animation/clip_46/end_frame=0
animation/clip_46/loops=false
animation/clip_47/name=""
animation/clip_47/start_frame=0
animation/clip_47/end_frame=0
animation/clip_47/loops=false
animation/clip_48/name=""
animation/clip_48/start_frame=0
animation/clip_48/end_frame=0
animation/clip_48/loops=false
animation/clip_49/name=""
animation/clip_49/start_frame=0
animation/clip_49/end_frame=0
animation/clip_49/loops=false
animation/clip_50/name=""
animation/clip_50/start_frame=0
animation/clip_50/end_frame=0
animation/clip_50/loops=false
animation/clip_51/name=""
animation/clip_51/start_frame=0
animation/clip_51/end_frame=0
animation/clip_51/loops=false
animation/clip_52/name=""
animation/clip_52/start_frame=0
animation/clip_52/end_frame=0
animation/clip_52/loops=false
animation/clip_53/name=""
animation/clip_53/start_frame=0
animation/clip_53/end_frame=0
animation/clip_53/loops=false
animation/clip_54/name=""
animation/clip_54/start_frame=0
animation/clip_54/end_frame=0
animation/clip_54/loops=false
animation/clip_55/name=""
animation/clip_55/start_frame=0
animation/clip_55/end_frame=0
animation/clip_55/loops=false
animation/clip_56/name=""
animation/clip_56/start_frame=0
animation/clip_56/end_frame=0
animation/clip_56/loops=false
animation/clip_57/name=""
animation/clip_57/start_frame=0
animation/clip_57/end_frame=0
animation/clip_57/loops=false
animation/clip_58/name=""
animation/clip_58/start_frame=0
animation/clip_58/end_frame=0
animation/clip_58/loops=false
animation/clip_59/name=""
animation/clip_59/start_frame=0
animation/clip_59/end_frame=0
animation/clip_59/loops=false
animation/clip_60/name=""
animation/clip_60/start_frame=0
animation/clip_60/end_frame=0
animation/clip_60/loops=false
animation/clip_61/name=""
animation/clip_61/start_frame=0
animation/clip_61/end_frame=0
animation/clip_61/loops=false
animation/clip_62/name=""
animation/clip_62/start_frame=0
animation/clip_62/end_frame=0
animation/clip_62/loops=false
animation/clip_63/name=""
animation/clip_63/start_frame=0
animation/clip_63/end_frame=0
animation/clip_63/loops=false
animation/clip_64/name=""
animation/clip_64/start_frame=0
animation/clip_64/end_frame=0
animation/clip_64/loops=false
animation/clip_65/name=""
animation/clip_65/start_frame=0
animation/clip_65/end_frame=0
animation/clip_65/loops=false
animation/clip_66/name=""
animation/clip_66/start_frame=0
animation/clip_66/end_frame=0
animation/clip_66/loops=false
animation/clip_67/name=""
animation/clip_67/start_frame=0
animation/clip_67/end_frame=0
animation/clip_67/loops=false
animation/clip_68/name=""
animation/clip_68/start_frame=0
animation/clip_68/end_frame=0
animation/clip_68/loops=false
animation/clip_69/name=""
animation/clip_69/start_frame=0
animation/clip_69/end_frame=0
animation/clip_69/loops=false
animation/clip_70/name=""
animation/clip_70/start_frame=0
animation/clip_70/end_frame=0
animation/clip_70/loops=false
animation/clip_71/name=""
animation/clip_71/start_frame=0
animation/clip_71/end_frame=0
animation/clip_71/loops=false
animation/clip_72/name=""
animation/clip_72/start_frame=0
animation/clip_72/end_frame=0
animation/clip_72/loops=false
animation/clip_73/name=""
animation/clip_73/start_frame=0
animation/clip_73/end_frame=0
animation/clip_73/loops=false
animation/clip_74/name=""
animation/clip_74/start_frame=0
animation/clip_74/end_frame=0
animation/clip_74/loops=false
animation/clip_75/name=""
animation/clip_75/start_frame=0
animation/clip_75/end_frame=0
animation/clip_75/loops=false
animation/clip_76/name=""
animation/clip_76/start_frame=0
animation/clip_76/end_frame=0
animation/clip_76/loops=false
animation/clip_77/name=""
animation/clip_77/start_frame=0
animation/clip_77/end_frame=0
animation/clip_77/loops=false
animation/clip_78/name=""
animation/clip_78/start_frame=0
animation/clip_78/end_frame=0
animation/clip_78/loops=false
animation/clip_79/name=""
animation/clip_79/start_frame=0
animation/clip_79/end_frame=0
animation/clip_79/loops=false
animation/clip_80/name=""
animation/clip_80/start_frame=0
animation/clip_80/end_frame=0
animation/clip_80/loops=false
animation/clip_81/name=""
animation/clip_81/start_frame=0
animation/clip_81/end_frame=0
animation/clip_81/loops=false
animation/clip_82/name=""
animation/clip_82/start_frame=0
animation/clip_82/end_frame=0
animation/clip_82/loops=false
animation/clip_83/name=""
animation/clip_83/start_frame=0
animation/clip_83/end_frame=0
animation/clip_83/loops=false
animation/clip_84/name=""
animation/clip_84/start_frame=0
animation/clip_84/end_frame=0
animation/clip_84/loops=false
animation/clip_85/name=""
animation/clip_85/start_frame=0
animation/clip_85/end_frame=0
animation/clip_85/loops=false
animation/clip_86/name=""
animation/clip_86/start_frame=0
animation/clip_86/end_frame=0
animation/clip_86/loops=false
animation/clip_87/name=""
animation/clip_87/start_frame=0
animation/clip_87/end_frame=0
animation/clip_87/loops=false
animation/clip_88/name=""
animation/clip_88/start_frame=0
animation/clip_88/end_frame=0
animation/clip_88/loops=false
animation/clip_89/name=""
animation/clip_89/start_frame=0
animation/clip_89/end_frame=0
animation/clip_89/loops=false
animation/clip_90/name=""
animation/clip_90/start_frame=0
animation/clip_90/end_frame=0
animation/clip_90/loops=false
animation/clip_91/name=""
animation/clip_91/start_frame=0
animation/clip_91/end_frame=0
animation/clip_91/loops=false
animation/clip_92/name=""
animation/clip_92/start_frame=0
animation/clip_92/end_frame=0
animation/clip_92/loops=false
animation/clip_93/name=""
animation/clip_93/start_frame=0
animation/clip_93/end_frame=0
animation/clip_93/loops=false
animation/clip_94/name=""
animation/clip_94/start_frame=0
animation/clip_94/end_frame=0
animation/clip_94/loops=false
animation/clip_95/name=""
animation/clip_95/start_frame=0
animation/clip_95/end_frame=0
animation/clip_95/loops=false
animation/clip_96/name=""
animation/clip_96/start_frame=0
animation/clip_96/end_frame=0
animation/clip_96/loops=false
animation/clip_97/name=""
animation/clip_97/start_frame=0
animation/clip_97/end_frame=0
animation/clip_97/loops=false
animation/clip_98/name=""
animation/clip_98/start_frame=0
animation/clip_98/end_frame=0
animation/clip_98/loops=false
animation/clip_99/name=""
animation/clip_99/start_frame=0
animation/clip_99/end_frame=0
animation/clip_99/loops=false
animation/clip_100/name=""
animation/clip_100/start_frame=0
animation/clip_100/end_frame=0
animation/clip_100/loops=false
animation/clip_101/name=""
animation/clip_101/start_frame=0
animation/clip_101/end_frame=0
animation/clip_101/loops=false
animation/clip_102/name=""
animation/clip_102/start_frame=0
animation/clip_102/end_frame=0
animation/clip_102/loops=false
animation/clip_103/name=""
animation/clip_103/start_frame=0
animation/clip_103/end_frame=0
animation/clip_103/loops=false
animation/clip_104/name=""
animation/clip_104/start_frame=0
animation/clip_104/end_frame=0
animation/clip_104/loops=false
animation/clip_105/name=""
animation/clip_105/start_frame=0
animation/clip_105/end_frame=0
animation/clip_105/loops=false
animation/clip_106/name=""
animation/clip_106/start_frame=0
animation/clip_106/end_frame=0
animation/clip_106/loops=false
animation/clip_107/name=""
animation/clip_107/start_frame=0
animation/clip_107/end_frame=0
animation/clip_107/loops=false
animation/clip_108/name=""
animation/clip_108/start_frame=0
animation/clip_108/end_frame=0
animation/clip_108/loops=false
animation/clip_109/name=""
animation/clip_109/start_frame=0
animation/clip_109/end_frame=0
animation/clip_109/loops=false
animation/clip_110/name=""
animation/clip_110/start_frame=0
animation/clip_110/end_frame=0
animation/clip_110/loops=false
animation/clip_111/name=""
animation/clip_111/start_frame=0
animation/clip_111/end_frame=0
animation/clip_111/loops=false
animation/clip_112/name=""
animation/clip_112/start_frame=0
animation/clip_112/end_frame=0
animation/clip_112/loops=false
animation/clip_113/name=""
animation/clip_113/start_frame=0
animation/clip_113/end_frame=0
animation/clip_113/loops=false
animation/clip_114/name=""
animation/clip_114/start_frame=0
animation/clip_114/end_frame=0
animation/clip_114/loops=false
animation/clip_115/name=""
animation/clip_115/start_frame=0
animation/clip_115/end_frame=0
animation/clip_115/loops=false
animation/clip_116/name=""
animation/clip_116/start_frame=0
animation/clip_116/end_frame=0
animation/clip_116/loops=false
animation/clip_117/name=""
animation/clip_117/start_frame=0
animation/clip_117/end_frame=0
animation/clip_117/loops=false
animation/clip_118/name=""
animation/clip_118/start_frame=0
animation/clip_118/end_frame=0
animation/clip_118/loops=false
animation/clip_119/name=""
animation/clip_119/start_frame=0
animation/clip_119/end_frame=0
animation/clip_119/loops=false
animation/clip_120/name=""
animation/clip_120/start_frame=0
animation/clip_120/end_frame=0
animation/clip_120/loops=false
animation/clip_121/name=""
animation/clip_121/start_frame=0
animation/clip_121/end_frame=0
animation/clip_121/loops=false
animation/clip_122/name=""
animation/clip_122/start_frame=0
animation/clip_122/end_frame=0
animation/clip_122/loops=false
animation/clip_123/name=""
animation/clip_123/start_frame=0
animation/clip_123/end_frame=0
animation/clip_123/loops=false
animation/clip_124/name=""
animation/clip_124/start_frame=0
animation/clip_124/end_frame=0
animation/clip_124/loops=false
animation/clip_125/name=""
animation/clip_125/start_frame=0
animation/clip_125/end_frame=0
animation/clip_125/loops=false
animation/clip_126/name=""
animation/clip_126/start_frame=0
animation/clip_126/end_frame=0
animation/clip_126/loops=false
animation/clip_127/name=""
animation/clip_127/start_frame=0
animation/clip_127/end_frame=0
animation/clip_127/loops=false
animation/clip_128/name=""
animation/clip_128/start_frame=0
animation/clip_128/end_frame=0
animation/clip_128/loops=false
animation/clip_129/name=""
animation/clip_129/start_frame=0
animation/clip_129/end_frame=0
animation/clip_129/loops=false
animation/clip_130/name=""
animation/clip_130/start_frame=0
animation/clip_130/end_frame=0
animation/clip_130/loops=false
animation/clip_131/name=""
animation/clip_131/start_frame=0
animation/clip_131/end_frame=0
animation/clip_131/loops=false
animation/clip_132/name=""
animation/clip_132/start_frame=0
animation/clip_132/end_frame=0
animation/clip_132/loops=false
animation/clip_133/name=""
animation/clip_133/start_frame=0
animation/clip_133/end_frame=0
animation/clip_133/loops=false
animation/clip_134/name=""
animation/clip_134/start_frame=0
animation/clip_134/end_frame=0
animation/clip_134/loops=false
animation/clip_135/name=""
animation/clip_135/start_frame=0
animation/clip_135/end_frame=0
animation/clip_135/loops=false
animation/clip_136/name=""
animation/clip_136/start_frame=0
animation/clip_136/end_frame=0
animation/clip_136/loops=false
animation/clip_137/name=""
animation/clip_137/start_frame=0
animation/clip_137/end_frame=0
animation/clip_137/loops=false
animation/clip_138/name=""
animation/clip_138/start_frame=0
animation/clip_138/end_frame=0
animation/clip_138/loops=false
animation/clip_139/name=""
animation/clip_139/start_frame=0
animation/clip_139/end_frame=0
animation/clip_139/loops=false
animation/clip_140/name=""
animation/clip_140/start_frame=0
animation/clip_140/end_frame=0
animation/clip_140/loops=false
animation/clip_141/name=""
animation/clip_141/start_frame=0
animation/clip_141/end_frame=0
animation/clip_141/loops=false
animation/clip_142/name=""
animation/clip_142/start_frame=0
animation/clip_142/end_frame=0
animation/clip_142/loops=false
animation/clip_143/name=""
animation/clip_143/start_frame=0
animation/clip_143/end_frame=0
animation/clip_143/loops=false
animation/clip_144/name=""
animation/clip_144/start_frame=0
animation/clip_144/end_frame=0
animation/clip_144/loops=false
animation/clip_145/name=""
animation/clip_145/start_frame=0
animation/clip_145/end_frame=0
animation/clip_145/loops=false
animation/clip_146/name=""
animation/clip_146/start_frame=0
animation/clip_146/end_frame=0
animation/clip_146/loops=false
animation/clip_147/name=""
animation/clip_147/start_frame=0
animation/clip_147/end_frame=0
animation/clip_147/loops=false
animation/clip_148/name=""
animation/clip_148/start_frame=0
animation/clip_148/end_frame=0
animation/clip_148/loops=false
animation/clip_149/name=""
animation/clip_149/start_frame=0
animation/clip_149/end_frame=0
animation/clip_149/loops=false
animation/clip_150/name=""
animation/clip_150/start_frame=0
animation/clip_150/end_frame=0
animation/clip_150/loops=false
animation/clip_151/name=""
animation/clip_151/start_frame=0
animation/clip_151/end_frame=0
animation/clip_151/loops=false
animation/clip_152/name=""
animation/clip_152/start_frame=0
animation/clip_152/end_frame=0
animation/clip_152/loops=false
animation/clip_153/name=""
animation/clip_153/start_frame=0
animation/clip_153/end_frame=0
animation/clip_153/loops=false
animation/clip_154/name=""
animation/clip_154/start_frame=0
animation/clip_154/end_frame=0
animation/clip_154/loops=false
animation/clip_155/name=""
animation/clip_155/start_frame=0
animation/clip_155/end_frame=0
animation/clip_155/loops=false
animation/clip_156/name=""
animation/clip_156/start_frame=0
animation/clip_156/end_frame=0
animation/clip_156/loops=false
animation/clip_157/name=""
animation/clip_157/start_frame=0
animation/clip_157/end_frame=0
animation/clip_157/loops=false
animation/clip_158/name=""
animation/clip_158/start_frame=0
animation/clip_158/end_frame=0
animation/clip_158/loops=false
animation/clip_159/name=""
animation/clip_159/start_frame=0
animation/clip_159/end_frame=0
animation/clip_159/loops=false
animation/clip_160/name=""
animation/clip_160/start_frame=0
animation/clip_160/end_frame=0
animation/clip_160/loops=false
animation/clip_161/name=""
animation/clip_161/start_frame=0
animation/clip_161/end_frame=0
animation/clip_161/loops=false
animation/clip_162/name=""
animation/clip_162/start_frame=0
animation/clip_162/end_frame=0
animation/clip_162/loops=false
animation/clip_163/name=""
animation/clip_163/start_frame=0
animation/clip_163/end_frame=0
animation/clip_163/loops=false
animation/clip_164/name=""
animation/clip_164/start_frame=0
animation/clip_164/end_frame=0
animation/clip_164/loops=false
animation/clip_165/name=""
animation/clip_165/start_frame=0
animation/clip_165/end_frame=0
animation/clip_165/loops=false
animation/clip_166/name=""
animation/clip_166/start_frame=0
animation/clip_166/end_frame=0
animation/clip_166/loops=false
animation/clip_167/name=""
animation/clip_167/start_frame=0
animation/clip_167/end_frame=0
animation/clip_167/loops=false
animation/clip_168/name=""
animation/clip_168/start_frame=0
animation/clip_168/end_frame=0
animation/clip_168/loops=false
animation/clip_169/name=""
animation/clip_169/start_frame=0
animation/clip_169/end_frame=0
animation/clip_169/loops=false
animation/clip_170/name=""
animation/clip_170/start_frame=0
animation/clip_170/end_frame=0
animation/clip_170/loops=false
animation/clip_171/name=""
animation/clip_171/start_frame=0
animation/clip_171/end_frame=0
animation/clip_171/loops=false
animation/clip_172/name=""
animation/clip_172/start_frame=0
animation/clip_172/end_frame=0
animation/clip_172/loops=false
animation/clip_173/name=""
animation/clip_173/start_frame=0
animation/clip_173/end_frame=0
animation/clip_173/loops=false
animation/clip_174/name=""
animation/clip_174/start_frame=0
animation/clip_174/end_frame=0
animation/clip_174/loops=false
animation/clip_175/name=""
animation/clip_175/start_frame=0
animation/clip_175/end_frame=0
animation/clip_175/loops=false
animation/clip_176/name=""
animation/clip_176/start_frame=0
animation/clip_176/end_frame=0
animation/clip_176/loops=false
animation/clip_177/name=""
animation/clip_177/start_frame=0
animation/clip_177/end_frame=0
animation/clip_177/loops=false
animation/clip_178/name=""
animation/clip_178/start_frame=0
animation/clip_178/end_frame=0
animation/clip_178/loops=false
animation/clip_179/name=""
animation/clip_179/start_frame=0
animation/clip_179/end_frame=0
animation/clip_179/loops=false
animation/clip_180/name=""
animation/clip_180/start_frame=0
animation/clip_180/end_frame=0
animation/clip_180/loops=false
animation/clip_181/name=""
animation/clip_181/start_frame=0
animation/clip_181/end_frame=0
animation/clip_181/loops=false
animation/clip_182/name=""
animation/clip_182/start_frame=0
animation/clip_182/end_frame=0
animation/clip_182/loops=false
animation/clip_183/name=""
animation/clip_183/start_frame=0
animation/clip_183/end_frame=0
animation/clip_183/loops=false
animation/clip_184/name=""
animation/clip_184/start_frame=0
animation/clip_184/end_frame=0
animation/clip_184/loops=false
animation/clip_185/name=""
animation/clip_185/start_frame=0
animation/clip_185/end_frame=0
animation/clip_185/loops=false
animation/clip_186/name=""
animation/clip_186/start_frame=0
animation/clip_186/end_frame=0
animation/clip_186/loops=false
animation/clip_187/name=""
animation/clip_187/start_frame=0
animation/clip_187/end_frame=0
animation/clip_187/loops=false
animation/clip_188/name=""
animation/clip_188/start_frame=0
animation/clip_188/end_frame=0
animation/clip_188/loops=false
animation/clip_189/name=""
animation/clip_189/start_frame=0
animation/clip_189/end_frame=0
animation/clip_189/loops=false
animation/clip_190/name=""
animation/clip_190/start_frame=0
animation/clip_190/end_frame=0
animation/clip_190/loops=false
animation/clip_191/name=""
animation/clip_191/start_frame=0
animation/clip_191/end_frame=0
animation/clip_191/loops=false
animation/clip_192/name=""
animation/clip_192/start_frame=0
animation/clip_192/end_frame=0
animation/clip_192/loops=false
animation/clip_193/name=""
animation/clip_193/start_frame=0
animation/clip_193/end_frame=0
animation/clip_193/loops=false
animation/clip_194/name=""
animation/clip_194/start_frame=0
animation/clip_194/end_frame=0
animation/clip_194/loops=false
animation/clip_195/name=""
animation/clip_195/start_frame=0
animation/clip_195/end_frame=0
animation/clip_195/loops=false
animation/clip_196/name=""
animation/clip_196/start_frame=0
animation/clip_196/end_frame=0
animation/clip_196/loops=false
animation/clip_197/name=""
animation/clip_197/start_frame=0
animation/clip_197/end_frame=0
animation/clip_197/loops=false
animation/clip_198/name=""
animation/clip_198/start_frame=0
animation/clip_198/end_frame=0
animation/clip_198/loops=false
animation/clip_199/name=""
animation/clip_199/start_frame=0
animation/clip_199/end_frame=0
animation/clip_199/loops=false
animation/clip_200/name=""
animation/clip_200/start_frame=0
animation/clip_200/end_frame=0
animation/clip_200/loops=false
animation/clip_201/name=""
animation/clip_201/start_frame=0
animation/clip_201/end_frame=0
animation/clip_201/loops=false
animation/clip_202/name=""
animation/clip_202/start_frame=0
animation/clip_202/end_frame=0
animation/clip_202/loops=false
animation/clip_203/name=""
animation/clip_203/start_frame=0
animation/clip_203/end_frame=0
animation/clip_203/loops=false
animation/clip_204/name=""
animation/clip_204/start_frame=0
animation/clip_204/end_frame=0
animation/clip_204/loops=false
animation/clip_205/name=""
animation/clip_205/start_frame=0
animation/clip_205/end_frame=0
animation/clip_205/loops=false
animation/clip_206/name=""
animation/clip_206/start_frame=0
animation/clip_206/end_frame=0
animation/clip_206/loops=false
animation/clip_207/name=""
animation/clip_207/start_frame=0
animation/clip_207/end_frame=0
animation/clip_207/loops=false
animation/clip_208/name=""
animation/clip_208/start_frame=0
animation/clip_208/end_frame=0
animation/clip_208/loops=false
animation/clip_209/name=""
animation/clip_209/start_frame=0
animation/clip_209/end_frame=0
animation/clip_209/loops=false
animation/clip_210/name=""
animation/clip_210/start_frame=0
animation/clip_210/end_frame=0
animation/clip_210/loops=false
animation/clip_211/name=""
animation/clip_211/start_frame=0
animation/clip_211/end_frame=0
animation/clip_211/loops=false
animation/clip_212/name=""
animation/clip_212/start_frame=0
animation/clip_212/end_frame=0
animation/clip_212/loops=false
animation/clip_213/name=""
animation/clip_213/start_frame=0
animation/clip_213/end_frame=0
animation/clip_213/loops=false
animation/clip_214/name=""
animation/clip_214/start_frame=0
animation/clip_214/end_frame=0
animation/clip_214/loops=false
animation/clip_215/name=""
animation/clip_215/start_frame=0
animation/clip_215/end_frame=0
animation/clip_215/loops=false
animation/clip_216/name=""
animation/clip_216/start_frame=0
animation/clip_216/end_frame=0
animation/clip_216/loops=false
animation/clip_217/name=""
animation/clip_217/start_frame=0
animation/clip_217/end_frame=0
animation/clip_217/loops=false
animation/clip_218/name=""
animation/clip_218/start_frame=0
animation/clip_218/end_frame=0
animation/clip_218/loops=false
animation/clip_219/name=""
animation/clip_219/start_frame=0
animation/clip_219/end_frame=0
animation/clip_219/loops=false
animation/clip_220/name=""
animation/clip_220/start_frame=0
animation/clip_220/end_frame=0
animation/clip_220/loops=false
animation/clip_221/name=""
animation/clip_221/start_frame=0
animation/clip_221/end_frame=0
animation/clip_221/loops=false
animation/clip_222/name=""
animation/clip_222/start_frame=0
animation/clip_222/end_frame=0
animation/clip_222/loops=false
animation/clip_223/name=""
animation/clip_223/start_frame=0
animation/clip_223/end_frame=0
animation/clip_223/loops=false
animation/clip_224/name=""
animation/clip_224/start_frame=0
animation/clip_224/end_frame=0
animation/clip_224/loops=false
animation/clip_225/name=""
animation/clip_225/start_frame=0
animation/clip_225/end_frame=0
animation/clip_225/loops=false
animation/clip_226/name=""
animation/clip_226/start_frame=0
animation/clip_226/end_frame=0
animation/clip_226/loops=false
animation/clip_227/name=""
animation/clip_227/start_frame=0
animation/clip_227/end_frame=0
animation/clip_227/loops=false
animation/clip_228/name=""
animation/clip_228/start_frame=0
animation/clip_228/end_frame=0
animation/clip_228/loops=false
animation/clip_229/name=""
animation/clip_229/start_frame=0
animation/clip_229/end_frame=0
animation/clip_229/loops=false
animation/clip_230/name=""
animation/clip_230/start_frame=0
animation/clip_230/end_frame=0
animation/clip_230/loops=false
animation/clip_231/name=""
animation/clip_231/start_frame=0
animation/clip_231/end_frame=0
animation/clip_231/loops=false
animation/clip_232/name=""
animation/clip_232/start_frame=0
animation/clip_232/end_frame=0
animation/clip_232/loops=false
animation/clip_233/name=""
animation/clip_233/start_frame=0
animation/clip_233/end_frame=0
animation/clip_233/loops=false
animation/clip_234/name=""
animation/clip_234/start_frame=0
animation/clip_234/end_frame=0
animation/clip_234/loops=false
animation/clip_235/name=""
animation/clip_235/start_frame=0
animation/clip_235/end_frame=0
animation/clip_235/loops=false
animation/clip_236/name=""
animation/clip_236/start_frame=0
animation/clip_236/end_frame=0
animation/clip_236/loops=false
animation/clip_237/name=""
animation/clip_237/start_frame=0
animation/clip_237/end_frame=0
animation/clip_237/loops=false
animation/clip_238/name=""
animation/clip_238/start_frame=0
animation/clip_238/end_frame=0
animation/clip_238/loops=false
animation/clip_239/name=""
animation/clip_239/start_frame=0
animation/clip_239/end_frame=0
animation/clip_239/loops=false
animation/clip_240/name=""
animation/clip_240/start_frame=0
animation/clip_240/end_frame=0
animation/clip_240/loops=false
animation/clip_241/name=""
animation/clip_241/start_frame=0
animation/clip_241/end_frame=0
animation/clip_241/loops=false
animation/clip_242/name=""
animation/clip_242/start_frame=0
animation/clip_242/end_frame=0
animation/clip_242/loops=false
animation/clip_243/name=""
animation/clip_243/start_frame=0
animation/clip_243/end_frame=0
animation/clip_243/loops=false
animation/clip_244/name=""
animation/clip_244/start_frame=0
animation/clip_244/end_frame=0
animation/clip_244/loops=false
animation/clip_245/name=""
animation/clip_245/start_frame=0
animation/clip_245/end_frame=0
animation/clip_245/loops=false
animation/clip_246/name=""
animation/clip_246/start_frame=0
animation/clip_246/end_frame=0
animation/clip_246/loops=false
animation/clip_247/name=""
animation/clip_247/start_frame=0
animation/clip_247/end_frame=0
animation/clip_247/loops=false
animation/clip_248/name=""
animation/clip_248/start_frame=0
animation/clip_248/end_frame=0
animation/clip_248/loops=false
animation/clip_249/name=""
animation/clip_249/start_frame=0
animation/clip_249/end_frame=0
animation/clip_249/loops=false
animation/clip_250/name=""
animation/clip_250/start_frame=0
animation/clip_250/end_frame=0
animation/clip_250/loops=false
animation/clip_251/name=""
animation/clip_251/start_frame=0
animation/clip_251/end_frame=0
animation/clip_251/loops=false
animation/clip_252/name=""
animation/clip_252/start_frame=0
animation/clip_252/end_frame=0
animation/clip_252/loops=false
animation/clip_253/name=""
animation/clip_253/start_frame=0
animation/clip_253/end_frame=0
animation/clip_253/loops=false
animation/clip_254/name=""
animation/clip_254/start_frame=0
animation/clip_254/end_frame=0
animation/clip_254/loops=false
animation/clip_255/name=""
animation/clip_255/start_frame=0
animation/clip_255/end_frame=0
animation/clip_255/loops=false
animation/clip_256/name=""
animation/clip_256/start_frame=0
animation/clip_256/end_frame=0
animation/clip_256/loops=false
       GDSC            U      �����׶�   �����Ķ�   ���������¶�   �������Ӷ���   �����������Ҷ���   �����¶�   ���������������Ŷ���   ����׶��   �����������¶���   ζ��   ����������ض      Player       �@                                                     $      ,   	   2   
   8      ;      B      S      3YY5;�  �  PQT�  PQY8;�  �  Y8;�  V�  YY0�  P�  QV�  &P�  �  QV�  &�  T�  V�  �  T�	  �  �  (V�  �  T�	  �  �  �
  �  P�
  R�  T�
  �  R�  �  QY`    [gd_scene load_steps=2 format=2]

[ext_resource path="res://camera/Camera.gd" type="Script" id=1]

[node name="Camera" type="Camera"]
script = ExtResource( 1 )
[gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDSC                  ������������۶��   ���ⶶ��   ���󶶶�   ����ⶶ�                                                              2YY>N�  �  R�  �  �  R�  �  YOY`  GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDSC                   ���Ӷ���   �����������ƶ���                         3YYB�  Y`             GDSC   6      j   1     ������������϶��   ����������   �������򶶶�   ���涶��   �����������   ��������������ƶ   ����������Ķ   �������Ŷ���   ��������������Ķ   ����������   �����������򶶶�   ����������   �����������󶶶�   �������   ��������������   �����ٶ�   �����������¶���   ������Ѷ   ����������Ҷ   ���������Ӷ�   �����϶�   ������Ŷ   ������¶   ���������������Ŷ���   ����׶��   ��������۶��   �����ض�   ̶��   �������Ҷ���   ����������Ķ   �������Ķ���   �������������¶�   ���������ƶ�   ����������������ƶ��   ���������ڶ�   ��������������Ŷ   ���ƶ���   ���������������Ŷ���   ϶��   ��������۶��   ���۶���   ����������������ض��   ���϶���   ������������۶��   ���󶶶�   ����������������Ķ��   ����¶��   ����������������Ҷ��   ����ⶶ�   ���ⶶ��   �������������Ӷ�   ����������������������Ҷ   ������������ƶ��   ����Ķ��                                        (                      get_power_up      _get_power_up            
   move_right     	   move_left         sprint    �������?      jump  333333�?      idle      walk      double_jump                          
                           	      
   !      &      +      0      5      :      ?      D      I      N      S      Z      [      a      l      m      t      |      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4     5   
  6     7     8     9   4  :   7  ;   8  <   A  =   E  >   K  ?   R  @   W  A   [  B   `  C   i  D   m  E   q  F   w  G   z  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _     `     a     b     c     d     e     f   $  g   *  h   .  i   /  j   3YY>�  N�  �  R�  �  R�  �  YOYY8;�  Y5;�  W�  �  Y:�	  �  Y:�
  �  Y:�  �  Y:�  �  Y:�  �  Y:�  �  Y;�  �  Y;�  �  Y;�  Y;�  Y;�  �  T�  YY0�  PQV�  �  T�  P�	  RR�
  Q�  Y0�  P�  QV�  �  T�  T�  �  �  ;�  �  PQ�  &�  V�  �  �  �  �  T�  Y�  ;�  �  PQ�  �   P�  R�  Q�  �!  P�  Q�  �"  PQ�  �#  P�  R�  Q�  Y0�$  PQV�  W�  T�%  T�&  �  �  �  �  �  Y0�'  P�(  QV�  &�  T�)  �(  V�  .�  �  T�*  P�(  QYY0�  PQV�  ;�  �+  T�,  �  ;�-  �	  �  &�.  T�/  P�  QV�  �  �+  T�0  �  &�.  T�/  P�  QV�  �  �+  T�1  �  &�.  T�/  P�  QV�  �-  �
  �  �2  P�  P�  �-  R�  R�  QR�  P�  R�  R�  QQ�  .�  �  Y0�   P�  R�  QV�  �  �  �  �  �  �  &�  	�  V�  �  �  �  &�  V�  �  �  �  &�.  T�/  P�  QV�  �  �  �  �  �  �  �  �  T�  �  (V�  &�.  T�3  P�  QV�  �  �  YY0�!  P�  QV�  &�.  T�/  P�  QV�  &�  �  T�  �  �  V�  �  �  �  �  �  �  �  �  T�  �  �  �  Y0�"  PQV�  &�  V�  &�  �  V�  �  �  P�  R�  R�  QYY0�#  P�  R�  QV�  &�  �+  T�1  �  V�  �$  PQ�  &�  �+  T�0  �  V�  �$  PQY�  &�  V�  �'  P�  Q�  '�  V�  &�  �+  T�,  V�  �'  P�  Q�  (V�  �'  P�  QYY0�4  P�5  QV�  &�5  �  V�  �  �  �  Y`      [gd_scene load_steps=5 format=2]

[ext_resource path="res://assets/polycat.dae" type="PackedScene" id=1]
[ext_resource path="res://player/Player.gd" type="Script" id=2]

[sub_resource type="CapsuleShape" id=1]
radius = 0.218476
height = 0.792845

[sub_resource type="SpatialMaterial" id=2]
albedo_color = Color( 0.12549, 0.839216, 0.0862745, 1 )

[node name="Player" type="KinematicBody"]
script = ExtResource( 2 )

[node name="CollisionShape" type="CollisionShape" parent="."]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 0.8, 0 )
shape = SubResource( 1 )

[node name="Graphics" parent="." instance=ExtResource( 1 )]
transform = Transform( -4.37114e-08, 0, 1, 0, 1, 0, -1, 0, -4.37114e-08, 0, 0, 0 )

[node name="Cone" parent="Graphics/Armature/Skeleton" index="0"]
transform = Transform( 1, 0, -3.55271e-15, 0, 1, 0, 3.55271e-15, 0, 1, 0, 0, 0 )
material/0 = SubResource( 2 )

[editable path="Graphics"]
       [gd_scene load_steps=6 format=2]

[ext_resource path="res://powerups/Powerup.gd" type="Script" id=1]
[ext_resource path="res://powerups/label.png" type="Texture" id=2]

[sub_resource type="SphereMesh" id=1]
radius = 0.5
height = 1.0
radial_segments = 32
rings = 16

[sub_resource type="SpatialMaterial" id=2]
albedo_color = Color( 1, 0.992157, 0, 1 )

[sub_resource type="SphereShape" id=3]
radius = 0.5

[node name="DoubleJump" type="Spatial"]
script = ExtResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="Area" type="Area" parent="."]

[node name="CollisionShape" type="CollisionShape" parent="Area"]
shape = SubResource( 3 )

[node name="Timer" type="Timer" parent="."]
wait_time = 3.0

[node name="Sprite3D" type="Sprite3D" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0.74189, 0 )
visible = false
texture = ExtResource( 2 )

[connection signal="body_entered" from="Area" to="." method="_on_Area_body_entered"]
[connection signal="timeout" from="Timer" to="." method="_on_Timer_timeout"]
  GDSC            g      ������ڶ   �������ƶ���   ���޶���   �����������Ӷ���   ����ڶ��   �����Ӆ򶶶�   ����Ķ��   ����Ķ��   ���������������Ŷ���   ����׶��   ��������۶��   �����ض�   ̶��   ��������������������Ҷ��   ���϶���   ���Ӷ���   ������Ŷ   ����������ڶ   ������Ӷ   ����¶��   ����������������¶��   ���������Ӷ�      double_jump              Player        get_power_up                                	                              &   	   .   
   /      6      >      G      M      S      Y      Z      [      a      e      3YY8;�  Y5;�  W�  Y5;�  W�  Y5;�  W�  YY0�  P�	  QV�  �
  T�  T�  �  YY0�  P�  QV�  &�  T�  �  V�  �  T�  P�  R�  Q�  �  T�  �  �  �  T�  �  �  �  T�  PQYYY0�  PQV�  �  PQY`            GDST�   .       �  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��    XX6��UUTT  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UU		�<��UUTT  ��UUUU����UU  ��UU    ��UUXX  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��    �`��    %  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��    \\�e��UUTT  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU��     \��  XXXU6��TTTT�� 8   p��     �  ��UUUU  ��UUU�����UUU��     5  ��				��  r��     ����UUU  �� %%%  ��XXXX  ��UUUU�� 8   p��     �  ��UUUU  ��UUUU  ��UUUU  ��UUUU��     X��  �  U��    %  ��UUU%  ��UUUX��     X��     c��     {��     c ��UUUX��     ���     ^���9   	  ��UUUU��  \\\\���e  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU��  �`pP��  UU	��  UUXX�� `��C��  VU5%��  UUp@��  	%��  ����������  5555  ��				��  WU��  �VT��ߖ    ��%%%%  ��XXXX ���UU���  VW%��  UUp@��  	  ��UUUU  ��UUUU  ��UUUU��  XX  ��  UU����  %%%%  ��%%%%  ��XXXX��  XXXX��  cccc��  UU����  ]U%��  %%%%��  �TT���  UU� ��  5�  ��UUUU��  \\\X��ߖ  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU��  XXPp��  	��  XX\W�� 8ccC���  %5��  ��@p��  %%%��  ������  ���p��  5555  ��				�<��TTTT��  \\T���ߖ  ��%%%%  ��XXXX����@@@���  UU%���  UU ���     ��UUUU  ��UUUU  ��UUUU  ��UUUU �����  %%%%��  ````��  		��  XX\W��  cccc�� ������  ����  ��````��  �������a  �`��  5  ��UUUU  ��			U����TTTU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��%UU��  UUW ��  U]R ��6� ��  UWx ��  UU� ��  	  ��  V\p ��  U�% ��  555 ��  XX�   ��   U��  �% ��  ```   ��   U  ��   U���TTTU��  UVp ��  UU� ��  		   ��UUUU  ��UUUU  ��UUUU  ��UUUU������  %%%%�� 8`�  ��  UUW ��  U]R ��  ccc �� ��� ��  ���   ��```U��  TTT���  UU� ��  %	    ��UUUU��  �V� ���<   ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��i		%��  `UU���     ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��  ����  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ��UU��  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUUU  ��UUUU  ��UUU����UUUT  ��UUUU  ��UUUU��     `=���UUUT��     XM"��UUUT  ��UUUU  ��UUUU  ��UUUU,���UUU� ��UUUT  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��       ��UUUU  ������  ��UUUU�H��UU���  @zUC��  �R���   
5M"��UZPP��  `bii��  *�s��"9x@@@��M"���   �W�� ��UUVT  ��UUUU��   �T���  �����   �CC��   �^���   *���   �W'��  	��    ��UUUU  ������  ��UUUU��  @@�   ��& ���  �R���  %
��  �V(��  iii���  br�*��  ��\���  ��%*��  U	W���    ��UUUUN�����  �����  CqU�ݾƂ���(  ��DDDf��  �W� ��XXTU� ��QYRY  ��UUUU  ������  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU  ��UUUU��  ��  ���     ��UUUU  ��UUUU  ��UUUUDj��PPUU  ��UUUU  ��UUUU  ��UUUU  ������  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ������  ��UUUU����   $  ��UUUU����UUUQ���   &  ��UUUU���UUUح��UUUT  ��UUUU  ��UUUU3���UUUT  ��������� �@���Ae����(B"�q߇1,O���B,(����g!--'��ls�`��=�IJ�kS=��1 �����c9
=%���j  ������  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU�  ��UUU����9p  �إ��TUU�  ��UUU�IJ��TUU�  ��UUU�  ��������Ls  �����s  �W���Z :�,c��UU�%��Lk  ����4�����  ��U���  ��U���  ��U�����u�$�������E���  ��������| t����Ҕ o������������8�$������������ޙΣ���u�������    [remap]

importer="texture"
type="StreamTexture"
path.s3tc="res://.import/label.png-469c7bce7a87082ee2b42119739d33e8.s3tc.stex"
path.etc="res://.import/label.png-469c7bce7a87082ee2b42119739d33e8.etc.stex"
metadata={
"imported_formats": [ "s3tc", "etc" ],
"vram_texture": true
}

[deps]

source_file="res://powerups/label.png"
dest_files=[ "res://.import/label.png-469c7bce7a87082ee2b42119739d33e8.s3tc.stex", "res://.import/label.png-469c7bce7a87082ee2b42119739d33e8.etc.stex" ]

[params]

compress/mode=2
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=true
flags/filter=true
flags/mipmaps=true
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
          [remap]

path="res://camera/Camera.gdc"
        [remap]

path="res://enums/DirectionEnum.gdc"
  [remap]

path="res://managers/Signals.gdc"
     [remap]

path="res://player/Player.gdc"
        [remap]

path="res://powerups/Powerup.gdc"
     �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes�                     class         DirectionEnum         language      GDScript      path      res://enums/DirectionEnum.gd      base   	   Reference      _global_script_class_icons(               DirectionEnum             application/config/name         3d_platform_godot      application/run/main_scene         res://World.tscn   application/config/icon         res://icon.png     autoload/Signals$         *res://managers/Signals.gd     input/move_right`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script         input/move_left`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script      
   input/jump`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script         input/sprint`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script      )   physics/common/enable_pause_aware_picking         $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres            