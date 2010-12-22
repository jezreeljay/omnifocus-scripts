FasdUAS 1.101.10   ��   ��    k             l      ��  ��   nh	# DESCRIPTION #
	
	This script "snoozes" the currently selected actions or projects by setting the start date to given number of days in the future.		
	# LICENSE #
	
	Copyright � 2010 Dan Byler (contact: dbyler@gmail.com)
	Licensed under MIT License (http://www.opensource.org/licenses/mit-license.php)
	
	
	# CHANGE HISTORY #
	
	0.2c (2010-06-22)
	-	Actual fix for autosave
	
	0.2b (2010-06-21)
	-	Encapsulated autosave in "try" statements in case this fails
	
	0.2 (2010-06-15)
	-	Fixed Growl code
	-	Added performance optimization (thanks, Curt Clifton)
	-	Changed from LGPL to MIT license (MIT is less restrictive)
			0.1: Original release. (Thanks to Curt Clifton, Nanovivid, and Macfaninpdx for various pieces of code)	
	# INSTALLATION #
	
	-	Copy to ~/Library/Scripts/Applications/Omnifocus 	-	If desired, add to the OmniFocus toolbar using View > Customize Toolbar... within OmniFocus	
	# KNOWN BUGS #	
	-	When the script is invoked from the OmniFocus toolbar and canceled, OmniFocus returns an error. This issue does not occur when invoked from the script menu, a FastScripts or Quicksilver trigger, etc.		     � 	 	�  	 #   D E S C R I P T I O N   # 
 	 
 	 T h i s   s c r i p t   " s n o o z e s "   t h e   c u r r e n t l y   s e l e c t e d   a c t i o n s   o r   p r o j e c t s   b y   s e t t i n g   t h e   s t a r t   d a t e   t o   g i v e n   n u m b e r   o f   d a y s   i n   t h e   f u t u r e .  	  	 
 	 #   L I C E N S E   # 
 	 
 	 C o p y r i g h t   �   2 0 1 0   D a n   B y l e r   ( c o n t a c t :   d b y l e r @ g m a i l . c o m ) 
 	 L i c e n s e d   u n d e r   M I T   L i c e n s e   ( h t t p : / / w w w . o p e n s o u r c e . o r g / l i c e n s e s / m i t - l i c e n s e . p h p ) 
 	 
 	 
 	 #   C H A N G E   H I S T O R Y   # 
 	 
 	 0 . 2 c   ( 2 0 1 0 - 0 6 - 2 2 ) 
 	 - 	 A c t u a l   f i x   f o r   a u t o s a v e 
 	 
 	 0 . 2 b   ( 2 0 1 0 - 0 6 - 2 1 ) 
 	 - 	 E n c a p s u l a t e d   a u t o s a v e   i n   " t r y "   s t a t e m e n t s   i n   c a s e   t h i s   f a i l s 
 	 
 	 0 . 2   ( 2 0 1 0 - 0 6 - 1 5 ) 
 	 - 	 F i x e d   G r o w l   c o d e 
 	 - 	 A d d e d   p e r f o r m a n c e   o p t i m i z a t i o n   ( t h a n k s ,   C u r t   C l i f t o n ) 
 	 - 	 C h a n g e d   f r o m   L G P L   t o   M I T   l i c e n s e   ( M I T   i s   l e s s   r e s t r i c t i v e ) 
 	 	  	 0 . 1 :   O r i g i n a l   r e l e a s e .   ( T h a n k s   t o   C u r t   C l i f t o n ,   N a n o v i v i d ,   a n d   M a c f a n i n p d x   f o r   v a r i o u s   p i e c e s   o f   c o d e )   	 
 	 #   I N S T A L L A T I O N   # 
 	 
 	 - 	 C o p y   t o   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / O m n i f o c u s    	 - 	 I f   d e s i r e d ,   a d d   t o   t h e   O m n i F o c u s   t o o l b a r   u s i n g   V i e w   >   C u s t o m i z e   T o o l b a r . . .   w i t h i n   O m n i F o c u s   	 
 	 #   K N O W N   B U G S   #  	 
 	 - 	 W h e n   t h e   s c r i p t   i s   i n v o k e d   f r o m   t h e   O m n i F o c u s   t o o l b a r   a n d   c a n c e l e d ,   O m n i F o c u s   r e t u r n s   a n   e r r o r .   T h i s   i s s u e   d o e s   n o t   o c c u r   w h e n   i n v o k e d   f r o m   t h e   s c r i p t   m e n u ,   a   F a s t S c r i p t s   o r   Q u i c k s i l v e r   t r i g g e r ,   e t c .  	 	    
  
 l     ��������  ��  ��        l          j     �� �� 0 	showalert 	showAlert  m     ��
�� boovfals  2 ,if true, will display success/failure alerts     �   X i f   t r u e ,   w i l l   d i s p l a y   s u c c e s s / f a i l u r e   a l e r t s      l          j    �� �� 0 usegrowl useGrowl  m    ��
�� boovtrue  8 2if true, will use Growl for success/failure alerts     �   d i f   t r u e ,   w i l l   u s e   G r o w l   f o r   s u c c e s s / f a i l u r e   a l e r t s      l          j    �� �� 0 defaultsnooze defaultSnooze  m    ����   ) #number of days to snooze by default     �     F n u m b e r   o f   d a y s   t o   s n o o z e   b y   d e f a u l t   ! " ! j   	 �� #�� 0 alertitemnum alertItemNum # m   	 
 $ $ � % %   "  & ' & j    �� (�� 0 alertdaynum alertDayNum ( m     ) ) � * *   '  + , + j    �� -�� 0 growlappname growlAppName - m     . . � / /  D a n ' s   S c r i p t s ,  0 1 0 j    �� 2�� $0 allnotifications allNotifications 2 J     3 3  4 5 4 m     6 6 � 7 7  G e n e r a l 5  8�� 8 m     9 9 � : : 
 E r r o r��   1  ; < ; j    �� =�� ,0 enablednotifications enabledNotifications = J     > >  ? @ ? m     A A � B B  G e n e r a l @  C�� C m     D D � E E 
 E r r o r��   <  F G F j     �� H�� "0 iconapplication iconApplication H m     I I � J J  O m n i F o c u s . a p p G  K L K l     ��������  ��  ��   L  M N M l     ��������  ��  ��   N  O P O l   { Q���� Q O    { R S R k   z T T  U V U O   o W X W O   n Y Z Y k   m [ [  \ ] \ r    " ^ _ ^ n      ` a ` 2    ��
�� 
OTst a 1    ��
�� 
FCcn _ o      ���� $0 theselecteditems theSelectedItems ]  b c b r   # , d e d l  # * f���� f I  # *�� g��
�� .corecnte****       **** g n   # & h i h 2  $ &��
�� 
cobj i o   # $���� $0 theselecteditems theSelectedItems��  ��  ��   e o      ���� 0 numitems numItems c  j k j Z   - R l m���� l =  - 0 n o n o   - .���� 0 numitems numItems o m   . /����   m k   3 N p p  q r q r   3 6 s t s m   3 4 u u � v v 
 E r r o r t o      ���� 0 	alertname 	alertName r  w x w r   7 : y z y m   7 8 { { � | |  S c r i p t   f a i l u r e z o      ���� 0 
alerttitle 
alertTitle x  } ~ } r   ; @  �  m   ; < � � � � � 2 N o   v a l i d   t a s k ( s )   s e l e c t e d � o      ���� 0 	alerttext 	alertText ~  � � � n  A K � � � I   B K�� ����� 
0 notify   �  � � � o   B C���� 0 	alertname 	alertName �  � � � o   C D���� 0 
alerttitle 
alertTitle �  ��� � o   D G���� 0 	alerttext 	alertText��  ��   �  f   A B �  ��� � L   L N����  ��  ��  ��   k  � � � l  S S��������  ��  ��   �  � � � I  S s�� � �
�� .sysodlogaskr        TEXT � m   S V � � � � � 2 S n o o z e   f o r   h o w   m a n y   d a y s ? � �� � �
�� 
dtxt � o   Y ^���� 0 defaultsnooze defaultSnooze � �� � �
�� 
btns � J   a i � �  � � � m   a d � � � � �  C a n c e l �  ��� � m   d g � � � � �  O K��   � �� ���
�� 
dflt � m   l m���� ��   �  � � � r   t � � � � c   t  � � � l  t { ����� � l  t { ����� � n   t { � � � 1   w {��
�� 
ttxt � l  t w ����� � 1   t w��
�� 
rslt��  ��  ��  ��  ��  ��   � m   { ~��
�� 
long � o      ���� 0 snoozelength snoozeLength �  � � � r   � � � � � \   � � � � � l  � � ����� � I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��   � l  � � ����� � e   � � � � n   � � � � � 1   � ���
�� 
time � l  � � ����� � I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � o      ���� 0 
todaystart 
todayStart �  � � � Z   � � � ����� � >  � � � � � o   � ����� 0 snoozelength snoozeLength � m   � �����  � r   � � � � � m   � � � � � � �  s � o      ���� 0 alertdaynum alertDayNum��  ��   �  � � � r   � � � � � o   � ����� 0 numitems numItems � o      ���� 0 	selectnum 	selectNum �  � � � r   � � � � � m   � �����   � o      ���� 0 
successtot 
successTot �  � � � r   � � � � � m   � ���
�� boovfals � o      ���� 0 autosave   �  � � � V   � � � � k   �
 � �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
valL � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 	selectnum 	selectNum � o   � ����� $0 theselecteditems theSelectedItems � o      ���� 0 selecteditem selectedItem �  � � � r   � � � � � n  � � � � � I   � ��� ����� 
0 snooze   �  � � � o   � ����� 0 selecteditem selectedItem �  � � � o   � ����� 0 
todaystart 
todayStart �  ��� � o   � ����� 0 snoozelength snoozeLength��  ��   �  f   � � � o      ���� 0 	succeeded   �  � � � Z  �  � ����� � o   � ����� 0 	succeeded   � r   � � � � � [   � � � � � o   � ����� 0 
successtot 
successTot � m   � �����  � o      ���� 0 
successtot 
successTot��  ��   �  ��� � r  
 � � � \   � � � o  ���� 0 	selectnum 	selectNum � m  ����  � o      ���� 0 	selectnum 	selectNum��   � ?   � � � � � o   � ����� 0 	selectnum 	selectNum � m   � �����   �  � � � r   � � � m  ��
�� boovtrue � o      ���� 0 autosave   �  � � � r   �  � m   �  G e n e r a l  o      ���� 0 	alertname 	alertName �  r  ! m   �  S c r i p t   c o m p l e t e o      ���� 0 
alerttitle 
alertTitle 	
	 Z "7���� ?  "' o  "%�� 0 
successtot 
successTot m  %&�~�~  r  *3 m  *- �  s o      �}�} 0 alertitemnum alertItemNum��  ��  
 �| r  8m c  8i b  8e b  8a b  8[ b  8W b  8S !  b  8O"#" b  8I$%$ b  8E&'& b  8?()( o  8;�{�{ 0 
successtot 
successTot) m  ;>** �++ 
   i t e m' o  ?D�z�z 0 alertitemnum alertItemNum% m  EH,, �-- $   s n o o z e d .   T h e   i t e m# o  IN�y�y 0 alertitemnum alertItemNum! m  OR.. �// 4   w i l l   b e c o m e   a v a i l a b l e   i n   o  SV�x�x 0 snoozelength snoozeLength m  WZ00 �11    d a y o  [`�w�w 0 alertdaynum alertDayNum m  ad22 �33  . m  eh�v
�v 
TEXT o      �u�u 0 	alerttext 	alertText�|   Z l   4�t�s4 6   565 4   �r7
�r 
FCdw7 m    �q�q 6 =   898 1    �p
�p 
pidx9 m    �o�o �t  �s   X 4   �n:
�n 
docu: m    �m�m  V ;�l; n pz<=< I  qz�k>�j�k 
0 notify  > ?@? o  qr�i�i 0 	alertname 	alertName@ ABA o  rs�h�h 0 
alerttitle 
alertTitleB C�gC o  sv�f�f 0 	alerttext 	alertText�g  �j  =  f  pq�l   S m     DD�                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  ��  ��   P EFE l     �e�d�c�e  �d  �c  F GHG i   ! $IJI I      �bK�a�b 
0 snooze  K LML o      �`�` 0 selecteditem selectedItemM NON o      �_�_ 0 
todaystart 
todayStartO P�^P o      �]�] 0 snoozelength snoozeLength�^  �a  J k     )QQ RSR r     TUT m     �\
�\ boovfalsU o      �[�[ 0 success  S VWV O    &XYX Q    %Z[�ZZ k    \\ ]^] r    _`_ l   a�Y�Xa [    bcb o    �W�W 0 
todaystart 
todayStartc l   d�V�Ud ]    efe m    �T�T  Q�f o    �S�S 0 snoozelength snoozeLength�V  �U  �Y  �X  ` o      �R�R 0 newstart newStart^ ghg r    iji o    �Q�Q 0 newstart newStartj n      klk 1    �P
�P 
FCDsl o    �O�O 0 selecteditem selectedItemh m�Nm r    non m    �M
�M boovtrueo o      �L�L 0 success  �N  [ R      �K�J�I
�K .ascrerr ****      � ****�J  �I  �Z  Y m    pp�                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  W q�Hq L   ' )rr o   ' (�G�G 0 success  �H  H sts l     �F�E�D�F  �E  �D  t uvu i   % (wxw I      �Cy�B�C 
0 notify  y z{z o      �A�A 0 	alertname 	alertName{ |}| o      �@�@ 0 
alerttitle 
alertTitle} ~�?~ o      �>�> 0 	alerttext 	alertText�?  �B  x Z     ���� =    ��� o     �=�= 0 	showalert 	showAlert� m    �<
�< boovfals� L   
 �;�;  � ��� =   ��� o    �:�: 0 usegrowl useGrowl� m    �9
�9 boovtrue� ��8� k    ��� ��� l   �7���7  � ) #check to make sure Growl is running   � ��� F c h e c k   t o   m a k e   s u r e   G r o w l   i s   r u n n i n g� ��� O   0��� r    /��� l   -��6�5� I   -�4��3
�4 .corecnte****       ****� l   )��2�1� 6   )��� 2    �0
�0 
pcap� l  ! (��/�.� =  ! (��� 1   " $�-
�- 
pnam� m   % '�� ���  G r o w l H e l p e r A p p�/  �.  �2  �1  �3  �6  �5  � o      �,�, 0 growlrunning GrowlRunning� m    ���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  � ��� Z   1 p���+�*� =   1 4��� o   1 2�)�) 0 growlrunning GrowlRunning� m   2 3�(�(  � k   7 l�� ��� l  7 7�'���'  �  try to activate Growl   � ��� * t r y   t o   a c t i v a t e   G r o w l� ��� Q   7 N���&� k   : E�� ��� I  : ?�%��$
�% .sysoexecTEXT���     TEXT� m   : ;�� ��� � / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�$  � ��#� I  @ E�"��!
�" .sysoexecTEXT���     TEXT� m   @ A�� ��� � ~ / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�!  �#  � R      � ��
�  .ascrerr ****      � ****�  �  �&  � ��� I  O T���
� .sysodelanull��� ��� nmbr� m   O P�� ?ə������  � ��� O  U l��� r   Y k��� l  Y i���� I  Y i���
� .corecnte****       ****� l  Y e���� 6  Y e��� 2  Y \�
� 
pcap� l  ] d���� =  ] d��� 1   ^ `�
� 
pnam� m   a c�� ���  G r o w l H e l p e r A p p�  �  �  �  �  �  �  � o      �� 0 growlrunning GrowlRunning� m   U V���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  �  �+  �*  � ��� l  q q����  �  notify   � ���  n o t i f y� ��� Z   q ������ @   q t��� o   q r�� 0 growlrunning GrowlRunning� m   r s�� � Q   w ����
� O   z ���� k   ~ ��� ��� I  ~ ��	��
�	 .registernull��� ��� null�  � ���
� 
appl� o   � ��� 0 growlappname growlAppName� ���
� 
anot� o   � ��� $0 allnotifications allNotifications� ���
� 
dnot� o   � ��� $0 allnotifications allNotifications� ��� 
� 
iapp� o   � ����� "0 iconapplication iconApplication�   � ���� I  � ������
�� .notifygrnull��� ��� null��  � ����
�� 
name� o   � ����� 0 	alertname 	alertName� ����
�� 
titl� o   � ����� 0 
alerttitle 
alertTitle� ����
�� 
appl� o   � ����� 0 growlappname growlAppName� �����
�� 
desc� o   � ����� 0 	alerttext 	alertText��  ��  � m   z {��"                                                                                  GRRR  alis    �  Progena                    ��ePH+   |9GrowlHelperApp.app                                              |;���         ����  	                	Resources     ����      ��6p     |9 |7 {� ?�   i  TProgena:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    P r o g e n a  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ������
�� .ascrerr ****      � ****��  ��  �
  �  � k   � ��� ��� r   � ���� b   � ���� o   � ����� 0 	alerttext 	alertText� m   � ��� ��� �       p . s .   D o n ' t   w o r r y  t h e   G r o w l   n o t i f i c a t i o n   f a i l e d   b u t   t h e   s c r i p t   w a s   s u c c e s s f u l .� o      ���� 0 	alerttext 	alertText� ���� I  � �����
�� .sysodlogaskr        TEXT� o   � ����� 0 	alerttext 	alertText� �����
�� 
disp� m   � ����� ��  ��  �  �8  � I  � ��� 
�� .sysodlogaskr        TEXT  o   � ����� 0 	alerttext 	alertText ����
�� 
disp m   � ����� ��  v �� l     ��������  ��  ��  ��       �������� $ ) . I	��   �������������������������� 0 	showalert 	showAlert�� 0 usegrowl useGrowl�� 0 defaultsnooze defaultSnooze�� 0 alertitemnum alertItemNum�� 0 alertdaynum alertDayNum�� 0 growlappname growlAppName�� $0 allnotifications allNotifications�� ,0 enablednotifications enabledNotifications�� "0 iconapplication iconApplication�� 
0 snooze  �� 
0 notify  
�� .aevtoappnull  �   � ****
�� boovfals
�� boovtrue��  ��
�� 
   6 9 ����    A D ��J�������� 
0 snooze  �� ����   �������� 0 selecteditem selectedItem�� 0 
todaystart 
todayStart�� 0 snoozelength snoozeLength��   ������������ 0 selecteditem selectedItem�� 0 
todaystart 
todayStart�� 0 snoozelength snoozeLength�� 0 success  �� 0 newstart newStart p����������  Q�
�� 
FCDs��  ��  �� *fE�O�  �� E�O���,FOeE�W X  hUO� ��x�������� 
0 notify  �� ����   �������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText��   ���������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText�� 0 growlrunning GrowlRunning ����������������������������������������������
�� 
pcap  
�� 
pnam
�� .corecnte****       ****
�� .sysoexecTEXT���     TEXT��  ��  
�� .sysodelanull��� ��� nmbr
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null
�� 
name
�� 
titl
�� 
desc
�� .notifygrnull��� ��� null
�� 
disp
�� .sysodlogaskr        TEXT�� �b   f  hY �b  e  �� *�-�[�,\Z�81j E�UO�j  : �j O�j W X 	 
hO�j O� *�-�[�,\Z�81j E�UY hO�k U I� A*�b  a b  a b  a b  a  O*a �a ��b  a �a  UW X 	 
hY �a %E�O�a kl Y �a kl 	 ��������
�� .aevtoappnull  �   � **** k    {  O����  ��  ��     2D������������������ u�� {�� ����� ����� � �������������������� ��~�}�|�{�z�y�x*,.02�w
�� 
docu
�� 
FCdw
�� 
pidx
�� 
FCcn
�� 
OTst�� $0 theselecteditems theSelectedItems
�� 
cobj
�� .corecnte****       ****�� 0 numitems numItems�� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText�� 
0 notify  
�� 
dtxt
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
ttxt
�� 
long�� 0 snoozelength snoozeLength
�� .misccurdldt    ��� null
�� 
time� 0 
todaystart 
todayStart�~ 0 	selectnum 	selectNum�} 0 
successtot 
successTot�| 0 autosave  
�{ 
valL�z 0 selecteditem selectedItem�y 
0 snooze  �x 0 	succeeded  
�w 
TEXT��|�x*�k/e*�k/�[�,\Zk81T*�,�-E�O��-j 	E�O�j   �E�O�E�O�E` O)��_ m+ OhY hOa a b  a a a lva la  O_ a ,a &E` O*j *j a ,EE`  O_ k a !Ec  Y hO�E` "OjE` #OfE` $O Mh_ "j��_ "/a %,E` &O)_ &_  _ m+ 'E` (O_ ( _ #kE` #Y hO_ "kE` "[OY��OeE` $Oa )E�Oa *E�O_ #k a +Ec  Y hO_ #a ,%b  %a -%b  %a .%_ %a /%b  %a 0%a 1&E` UUO)��_ m+ U ascr  ��ޭ