FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	# DESCRIPTION #

	This script takes the currently selected actions or projects and sets them to be due tomorrow. Works on tasks past due, currently due, or due in the future.		Logic applied to each item:		- If no original due date, sets due to tomorrow at the set time		- If original due date, sets due to tomorrow at the *original* due time		- If original due date AND start date, advances start date by same # of days as due date (this is to respect parameters of repeating actions)		- Ignores start date if there's no due date already assigned to a task	
		# LICENSE #
		Copyright � 2009-2010 Dan Byler (contact: dbyler@gmail.com)
	Licensed under MIT License (http://www.opensource.org/licenses/mit-license.php)	

	# CHANGE HISTORY #

	version 0.2c (2010-06-22)
	-	Actual fix for autosave

	version 0.2b (2010-06-21)
	-	Encapsulated autosave in "try" statements in case this fails

	version 0.2 (2010-06-15)
	-	Added performance optimization (thanks to Curt Clifton)
	-	Fixed Growl code (broke with Snow Leopard)
	-	Switched to MIT license (simpler, less restrictive)
	version 0.1: Initial release. Based on my Defer script, which incorporates bug fixes from Curt Clifton. Also uses method that doesn't call Growl directly. This code should be friendly for machines that don't have Growl installed. In my testing, I found that GrowlHelperApp crashes on nearly 10% of AppleScript calls, so the script checks for GrowlHelperApp and launches it if not running. (Thanks to Nanovivid from forums.cocoaforge.com/viewtopic.php?p=32584 and Macfaninpdx from forums.macrumors.com/showthread.php?t=423718 for the information needed to get this working	# INSTALLATION #	-	Copy to ~/Library/Scripts/Applications/Omnifocus 	-	If desired, add to the OmniFocus toolbar using View > Customize Toolbar... within OmniFocus	# KNOWN BUGS #	-	When the script is invoked from the OmniFocus toolbar and canceled, OmniFocus returns an error. This issue does not occur when invoked from the script menu, a Quicksilver trigger, etc.		     � 	 	�  
 	 #   D E S C R I P T I O N   # 
 
 	 T h i s   s c r i p t   t a k e s   t h e   c u r r e n t l y   s e l e c t e d   a c t i o n s   o r   p r o j e c t s   a n d   s e t s   t h e m   t o   b e   d u e   t o m o r r o w .   W o r k s   o n   t a s k s   p a s t   d u e ,   c u r r e n t l y   d u e ,   o r   d u e   i n   t h e   f u t u r e .  	  	 L o g i c   a p p l i e d   t o   e a c h   i t e m :  	 	 -   I f   n o   o r i g i n a l   d u e   d a t e ,   s e t s   d u e   t o   t o m o r r o w   a t   t h e   s e t   t i m e  	 	 -   I f   o r i g i n a l   d u e   d a t e ,   s e t s   d u e   t o   t o m o r r o w   a t   t h e   * o r i g i n a l *   d u e   t i m e  	 	 -   I f   o r i g i n a l   d u e   d a t e   A N D   s t a r t   d a t e ,   a d v a n c e s   s t a r t   d a t e   b y   s a m e   #   o f   d a y s   a s   d u e   d a t e   ( t h i s   i s   t o   r e s p e c t   p a r a m e t e r s   o f   r e p e a t i n g   a c t i o n s )  	 	 -   I g n o r e s   s t a r t   d a t e   i f   t h e r e ' s   n o   d u e   d a t e   a l r e a d y   a s s i g n e d   t o   a   t a s k  	 
 	  	 #   L I C E N S E   # 
 	  	 C o p y r i g h t   �   2 0 0 9 - 2 0 1 0   D a n   B y l e r   ( c o n t a c t :   d b y l e r @ g m a i l . c o m ) 
 	 L i c e n s e d   u n d e r   M I T   L i c e n s e   ( h t t p : / / w w w . o p e n s o u r c e . o r g / l i c e n s e s / m i t - l i c e n s e . p h p )  	  
 
 	 #   C H A N G E   H I S T O R Y   #  
 
 	 v e r s i o n   0 . 2 c   ( 2 0 1 0 - 0 6 - 2 2 ) 
 	 - 	 A c t u a l   f i x   f o r   a u t o s a v e 
 
 	 v e r s i o n   0 . 2 b   ( 2 0 1 0 - 0 6 - 2 1 ) 
 	 - 	 E n c a p s u l a t e d   a u t o s a v e   i n   " t r y "   s t a t e m e n t s   i n   c a s e   t h i s   f a i l s 
  
 	 v e r s i o n   0 . 2   ( 2 0 1 0 - 0 6 - 1 5 ) 
 	 - 	 A d d e d   p e r f o r m a n c e   o p t i m i z a t i o n   ( t h a n k s   t o   C u r t   C l i f t o n ) 
 	 - 	 F i x e d   G r o w l   c o d e   ( b r o k e   w i t h   S n o w   L e o p a r d ) 
 	 - 	 S w i t c h e d   t o   M I T   l i c e n s e   ( s i m p l e r ,   l e s s   r e s t r i c t i v e ) 
  	 v e r s i o n   0 . 1 :   I n i t i a l   r e l e a s e .   B a s e d   o n   m y   D e f e r   s c r i p t ,   w h i c h   i n c o r p o r a t e s   b u g   f i x e s   f r o m   C u r t   C l i f t o n .   A l s o   u s e s   m e t h o d   t h a t   d o e s n ' t   c a l l   G r o w l   d i r e c t l y .   T h i s   c o d e   s h o u l d   b e   f r i e n d l y   f o r   m a c h i n e s   t h a t   d o n ' t   h a v e   G r o w l   i n s t a l l e d .   I n   m y   t e s t i n g ,   I   f o u n d   t h a t   G r o w l H e l p e r A p p   c r a s h e s   o n   n e a r l y   1 0 %   o f   A p p l e S c r i p t   c a l l s ,   s o   t h e   s c r i p t   c h e c k s   f o r   G r o w l H e l p e r A p p   a n d   l a u n c h e s   i t   i f   n o t   r u n n i n g .   ( T h a n k s   t o   N a n o v i v i d   f r o m   f o r u m s . c o c o a f o r g e . c o m / v i e w t o p i c . p h p ? p = 3 2 5 8 4   a n d   M a c f a n i n p d x   f r o m   f o r u m s . m a c r u m o r s . c o m / s h o w t h r e a d . p h p ? t = 4 2 3 7 1 8   f o r   t h e   i n f o r m a t i o n   n e e d e d   t o   g e t   t h i s   w o r k i n g   	 #   I N S T A L L A T I O N   #   	 - 	 C o p y   t o   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / O m n i f o c u s    	 - 	 I f   d e s i r e d ,   a d d   t o   t h e   O m n i F o c u s   t o o l b a r   u s i n g   V i e w   >   C u s t o m i z e   T o o l b a r . . .   w i t h i n   O m n i F o c u s   	 #   K N O W N   B U G S   #  	 - 	 W h e n   t h e   s c r i p t   i s   i n v o k e d   f r o m   t h e   O m n i F o c u s   t o o l b a r   a n d   c a n c e l e d ,   O m n i F o c u s   r e t u r n s   a n   e r r o r .   T h i s   i s s u e   d o e s   n o t   o c c u r   w h e n   i n v o k e d   f r o m   t h e   s c r i p t   m e n u ,   a   Q u i c k s i l v e r   t r i g g e r ,   e t c .  	 	    
  
 l     ��������  ��  ��        l          j     �� �� 0 	showalert 	showAlert  m     ��
�� boovfals  2 ,if true, will display success/failure alerts     �   X i f   t r u e ,   w i l l   d i s p l a y   s u c c e s s / f a i l u r e   a l e r t s      l          j    �� �� 0 usegrowl useGrowl  m    ��
�� boovtrue  8 2if true, will use Growl for success/failure alerts     �   d i f   t r u e ,   w i l l   u s e   G r o w l   f o r   s u c c e s s / f a i l u r e   a l e r t s      l     ��  ��    E ?property defaultSnooze : 1 --number of days to defer by default     �   ~ p r o p e r t y   d e f a u l t S n o o z e   :   1   - - n u m b e r   o f   d a y s   t o   d e f e r   b y   d e f a u l t       j    �� !�� 0 alertitemnum alertItemNum ! m     " " � # #      $ % $ j   	 �� &�� 0 alertdaynum alertDayNum & m   	 
 ' ' � ( (   %  ) * ) j    �� +�� 0 growlappname growlAppName + m     , , � - -  D a n ' s   S c r i p t s *  . / . j    �� 0�� $0 allnotifications allNotifications 0 J     1 1  2 3 2 m     4 4 � 5 5  G e n e r a l 3  6�� 6 m     7 7 � 8 8 
 E r r o r��   /  9 : 9 j    �� ;�� ,0 enablednotifications enabledNotifications ; J     < <  = > = m     ? ? � @ @  G e n e r a l >  A�� A m     B B � C C 
 E r r o r��   :  D E D j    �� F�� "0 iconapplication iconApplication F m     G G � H H  O m n i F o c u s . a p p E  I J I l      K L M K j    "�� N�� 0 duetime dueTime N m    !����  L L FTime of due for items not previously assigned a due time (24 hr clock)    M � O O � T i m e   o f   d u e   f o r   i t e m s   n o t   p r e v i o u s l y   a s s i g n e d   a   d u e   t i m e   ( 2 4   h r   c l o c k ) J  P Q P l     �� R S��   R L Fproperty homeDueTime : 20 --If item is in "Home" category, time of due    S � T T � p r o p e r t y   h o m e D u e T i m e   :   2 0   - - I f   i t e m   i s   i n   " H o m e "   c a t e g o r y ,   t i m e   o f   d u e Q  U V U l     ��������  ��  ��   V  W X W l     Y���� Y O      Z [ Z k    \ \  ] ^ ] O    _ ` _ O    a b a k    c c  d e d r    " f g f n      h i h 2    ��
�� 
OTst i 1    ��
�� 
FCcn g o      ���� $0 theselecteditems theSelectedItems e  j k j r   # , l m l l  # * n���� n I  # *�� o��
�� .corecnte****       **** o n   # & p q p 2  $ &��
�� 
cobj q o   # $���� $0 theselecteditems theSelectedItems��  ��  ��   m o      ���� 0 numitems numItems k  r s r Z   - R t u���� t =  - 0 v w v o   - .���� 0 numitems numItems w m   . /����   u k   3 N x x  y z y r   3 6 { | { m   3 4 } } � ~ ~ 
 E r r o r | o      ���� 0 	alertname 	alertName z   �  r   7 : � � � m   7 8 � � � � �  S c r i p t   f a i l u r e � o      ���� 0 
alerttitle 
alertTitle �  � � � r   ; @ � � � m   ; < � � � � � 2 N o   v a l i d   t a s k ( s )   s e l e c t e d � o      ���� 0 	alerttext 	alertText �  � � � n  A K � � � I   B K�� ����� 
0 notify   �  � � � o   B C���� 0 	alertname 	alertName �  � � � o   C D���� 0 
alerttitle 
alertTitle �  ��� � o   D G���� 0 	alerttext 	alertText��  ��   �  f   A B �  ��� � L   L N����  ��  ��  ��   s  � � � r   S f � � � \   S b � � � l  S X ����� � I  S X������
�� .misccurdldt    ��� null��  ��  ��  ��   � l  X a ����� � n   X a � � � 1   ] a��
�� 
time � l  X ] ����� � I  X ]������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � o      ���� 0 currdate currDate �  � � � r   g r � � � [   g n � � � o   g j���� 0 currdate currDate � m   j m����  Q� � o      ���� 0 currdate currDate �  � � � r   s x � � � o   s t���� 0 numitems numItems � o      ���� 0 	selectnum 	selectNum �  � � � r   y ~ � � � m   y z����   � o      ���� 0 
successtot 
successTot �  � � � r    � � � � m    ���
�� boovfals � o      ���� 0 autosave   �  � � � V   � � � � � k   � � � �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
valL � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 	selectnum 	selectNum � o   � ����� $0 theselecteditems theSelectedItems � o      ���� 0 selecteditem selectedItem �  � � � r   � � � � � n  � � � � � I   � ��� ����� 0 tomorrow   �  � � � o   � ����� 0 selecteditem selectedItem �  ��� � o   � ����� 0 currdate currDate��  ��   �  f   � � � o      ���� 0 	succeeded   �  � � � Z  � � � ����� � o   � ����� 0 	succeeded   � r   � � � � � [   � � � � � o   � ����� 0 
successtot 
successTot � m   � �����  � o      ���� 0 
successtot 
successTot��  ��   �  ��� � r   � � � � � \   � � � � � o   � ����� 0 	selectnum 	selectNum � m   � �����  � o      ���� 0 	selectnum 	selectNum��   � ?   � � � � � o   � ����� 0 	selectnum 	selectNum � m   � �����   �  � � � r   � � � � � m   � ���
�� boovtrue � o      ���� 0 autosave   �  � � � r   � � � � � m   � � � � � � �  G e n e r a l � o      ���� 0 	alertname 	alertName �  � � � r   � � � � � m   � � � � � � �  S c r i p t   c o m p l e t e � o      ���� 0 
alerttitle 
alertTitle �  � � � Z  � � � ����� � ?   � � � � � o   � ����� 0 
successtot 
successTot � m   � �����  � r   � � � � � m   � � � � � � �  s � o      ���� 0 alertitemnum alertItemNum��  ��   �  ��� � r   � � � � c   � � � � b   �
 � � � b   � � � � b   �  � � � o   � ����� 0 
successtot 
successTot � m   � � � � �   
   i t e m � o   ���� 0 alertitemnum alertItemNum � m  	 � $   n o w   d u e   t o m o r r o w . � m  
��
�� 
TEXT � o      ���� 0 	alerttext 	alertText��   b l   ���� 6    4   ��
�� 
FCdw m    ����  =    1    ��
�� 
pidx m    ���� ��  ��   ` 4   ��	
�� 
docu	 m    ����  ^ 
��
 n  I  ������ 
0 notify    o  ���� 0 	alertname 	alertName  o  ���� 0 
alerttitle 
alertTitle �� o  ���� 0 	alerttext 	alertText��  ��    f  ��   [ m     �                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  ��  ��   X  l     �������  ��  �    i   # & I      �~�}�~ 0 tomorrow    o      �|�| 0 selecteditem selectedItem �{ o      �z�z 0 currdate currDate�{  �}   k     y   r     !"! m     �y
�y boovfals" o      �x�x 0 success    #$# O    t%&% Q    s'(�w' k    j)) *+* r    ,-, n    ./. 1    �v
�v 
FCDd/ o    �u�u 0 selecteditem selectedItem- o      �t�t 0 
theduedate 
theDueDate+ 0�s0 Z    j12�r31 l   4�q�p4 >   565 o    �o�o 0 
theduedate 
theDueDate6 m    �n
�n 
msng�q  �p  2 k    V77 898 r    :;: \    <=< o    �m�m 0 
theduedate 
theDueDate= l   >�l�k> n    ?@? 1    �j
�j 
time@ o    �i�i 0 
theduedate 
theDueDate�l  �k  ; o      �h�h 0 theduestart theDueStart9 ABA r    &CDC ^    $EFE l   "G�g�fG \    "HIH o     �e�e 0 currdate currDateI o     !�d�d 0 theduestart theDueStart�g  �f  F m   " #�c�c  Q�D o      �b�b 0 thedelta theDeltaB JKJ r   ' .LML l  ' ,N�a�`N [   ' ,OPO o   ' (�_�_ 0 
theduedate 
theDueDateP l  ( +Q�^�]Q ]   ( +RSR o   ( )�\�\ 0 thedelta theDeltaS 1   ) *�[
�[ 
days�^  �]  �a  �`  M o      �Z�Z 0 newdue newDueK TUT r   / 4VWV o   / 0�Y�Y 0 newdue newDueW n      XYX 1   1 3�X
�X 
FCDdY o   0 1�W�W 0 selecteditem selectedItemU Z[Z r   5 :\]\ n   5 8^_^ 1   6 8�V
�V 
FCDs_ o   5 6�U�U 0 selecteditem selectedItem] o      �T�T 0 thestartdate theStartDate[ `a` Z   ; Rbc�S�Rb l  ; >d�Q�Pd >  ; >efe o   ; <�O�O 0 thestartdate theStartDatef m   < =�N
�N 
msng�Q  �P  c k   A Ngg hih r   A Hjkj l  A Fl�M�Ll [   A Fmnm o   A B�K�K 0 thestartdate theStartDaten l  B Eo�J�Io ]   B Epqp o   B C�H�H 0 thedelta theDeltaq 1   C D�G
�G 
days�J  �I  �M  �L  k o      �F�F 0 newstart newStarti r�Er r   I Nsts o   I J�D�D 0 newstart newStartt n      uvu 1   K M�C
�C 
FCDsv o   J K�B�B 0 selecteditem selectedItem�E  �S  �R  a w�Aw r   S Vxyx m   S T�@
�@ boovtruey o      �?�? 0 success  �A  �r  3 k   Y jzz {|{ r   Y f}~} l  Y b�>�= [   Y b��� o   Y Z�<�< 0 currdate currDate� l  Z a��;�:� ]   Z a��� o   Z _�9�9 0 duetime dueTime� 1   _ `�8
�8 
hour�;  �:  �>  �=  ~ n      ��� 1   c e�7
�7 
FCDd� o   b c�6�6 0 selecteditem selectedItem| ��5� r   g j��� m   g h�4
�4 boovtrue� o      �3�3 0 success  �5  �s  ( R      �2�1�0
�2 .ascrerr ****      � ****�1  �0  �w  & m    ���                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  $ ��/� L   u y�� J   u x�� ��.� o   u v�-�- 0 success  �.  �/   ��� l     �,�+�*�,  �+  �*  � ��� l     �)�(�'�)  �(  �'  � ��� i   ' *��� I      �&��%�& 
0 notify  � ��� o      �$�$ 0 	alertname 	alertName� ��� o      �#�# 0 
alerttitle 
alertTitle� ��"� o      �!�! 0 	alerttext 	alertText�"  �%  � Z     ������ =    ��� o     � �  0 	showalert 	showAlert� m    �
� boovfals� L   
 ��  � ��� =   ��� o    �� 0 usegrowl useGrowl� m    �
� boovtrue� ��� k    ��� ��� l   ����  � ) #check to make sure Growl is running   � ��� F c h e c k   t o   m a k e   s u r e   G r o w l   i s   r u n n i n g� ��� O   0��� r    /��� l   -���� I   -���
� .corecnte****       ****� l   )���� 6   )��� 2    �
� 
pcap� l  ! (���� =  ! (��� 1   " $�
� 
pnam� m   % '�� ���  G r o w l H e l p e r A p p�  �  �  �  �  �  �  � o      �� 0 growlrunning GrowlRunning� m    ���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  � ��� Z   1 p����� =   1 4��� o   1 2�� 0 growlrunning GrowlRunning� m   2 3��  � k   7 l�� ��� l  7 7�
���
  �  try to activate Growl   � ��� * t r y   t o   a c t i v a t e   G r o w l� ��� Q   7 N���	� k   : E�� ��� I  : ?���
� .sysoexecTEXT���     TEXT� m   : ;�� ��� � / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�  � ��� I  @ E���
� .sysoexecTEXT���     TEXT� m   @ A�� ��� � ~ / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�  �  � R      ���
� .ascrerr ****      � ****�  �  �	  � ��� I  O T� ���
�  .sysodelanull��� ��� nmbr� m   O P�� ?ə�������  � ���� O  U l��� r   Y k��� l  Y i������ I  Y i�����
�� .corecnte****       ****� l  Y e������ 6  Y e��� 2  Y \��
�� 
pcap� l  ] d������ =  ] d��� 1   ^ `��
�� 
pnam� m   a c�� ���  G r o w l H e l p e r A p p��  ��  ��  ��  ��  ��  ��  � o      ���� 0 growlrunning GrowlRunning� m   U V���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  ��  �  �  � ��� l  q q������  �  notify   � ���  n o t i f y� ���� Z   q ������� @   q t��� o   q r���� 0 growlrunning GrowlRunning� m   r s���� � Q   w ������ O   z ���� k   ~ ��� ��� I  ~ ������
�� .registernull��� ��� null��  � �� 
�� 
appl  o   � ����� 0 growlappname growlAppName ��
�� 
anot o   � ����� $0 allnotifications allNotifications ��
�� 
dnot o   � ����� $0 allnotifications allNotifications ����
�� 
iapp o   � ����� "0 iconapplication iconApplication��  � �� I  � �����
�� .notifygrnull��� ��� null��   ��	

�� 
name	 o   � ����� 0 	alertname 	alertName
 ��
�� 
titl o   � ����� 0 
alerttitle 
alertTitle ��
�� 
appl o   � ����� 0 growlappname growlAppName ����
�� 
desc o   � ����� 0 	alerttext 	alertText��  ��  � m   z {"                                                                                  GRRR  alis    �  Progena                    ��ePH+   |9GrowlHelperApp.app                                              |;���         ����  	                	Resources     ����      ��6p     |9 |7 {� ?�   i  TProgena:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    P r o g e n a  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  � k   � �  r   � � b   � � o   � ����� 0 	alerttext 	alertText m   � � � �       p . s .   D o n ' t   w o r r y  t h e   G r o w l   n o t i f i c a t i o n   f a i l e d   b u t   t h e   s c r i p t   w a s   s u c c e s s f u l . o      ���� 0 	alerttext 	alertText �� I  � ���
�� .sysodlogaskr        TEXT o   � ����� 0 	alerttext 	alertText ����
�� 
disp m   � ����� ��  ��  ��  �  � I  � ���
�� .sysodlogaskr        TEXT o   � ����� 0 	alerttext 	alertText �� ��
�� 
disp  m   � ����� ��  � !��! l     ��������  ��  ��  ��       ��"���� " ' ,#$ G��%&'��  " �������������������������� 0 	showalert 	showAlert�� 0 usegrowl useGrowl�� 0 alertitemnum alertItemNum�� 0 alertdaynum alertDayNum�� 0 growlappname growlAppName�� $0 allnotifications allNotifications�� ,0 enablednotifications enabledNotifications�� "0 iconapplication iconApplication�� 0 duetime dueTime�� 0 tomorrow  �� 
0 notify  
�� .aevtoappnull  �   � ****
�� boovfals
�� boovtrue# ��(�� (   4 7$ ��)�� )   ? B�� % ������*+���� 0 tomorrow  �� ��,�� ,  ������ 0 selecteditem selectedItem�� 0 currdate currDate��  * 	�������������������� 0 selecteditem selectedItem�� 0 currdate currDate�� 0 success  �� 0 
theduedate 
theDueDate�� 0 theduestart theDueStart�� 0 thedelta theDelta�� 0 newdue newDue�� 0 thestartdate theStartDate�� 0 newstart newStart+ 
�������������������
�� 
FCDd
�� 
msng
�� 
time��  Q�
�� 
days
�� 
FCDs
�� 
hour��  ��  �� zfE�O� m d��,E�O�� D���,E�O���!E�O��� E�O���,FO��,E�O�� ��� E�O���,FY hOeE�Y �b  � ��,FOeE�W X  	hUO�kv& �������-.���� 
0 notify  �� ��/�� /  �������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText��  - ���������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText�� 0 growlrunning GrowlRunning. ���0���������������������������~�}�|�{�z�y�x
�� 
pcap0  
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
iapp� 
�~ .registernull��� ��� null
�} 
name
�| 
titl
�{ 
desc
�z .notifygrnull��� ��� null
�y 
disp
�x .sysodlogaskr        TEXT�� �b   f  hY �b  e  �� *�-�[�,\Z�81j E�UO�j  : �j O�j W X 	 
hO�j O� *�-�[�,\Z�81j E�UY hO�k U I� A*�b  a b  a b  a b  a  O*a �a ��b  a �a  UW X 	 
hY �a %E�O�a kl Y �a kl ' �w1�v�u23�t
�w .aevtoappnull  �   � ****1 k     44  W�s�s  �v  �u  2  3 #�r�q0�p�o�n�m�l�k�j }�i ��h ��g�f�e�d�c�b�a�`�_�^�]�\�[ � � � ��Z
�r 
docu
�q 
FCdw
�p 
pidx
�o 
FCcn
�n 
OTst�m $0 theselecteditems theSelectedItems
�l 
cobj
�k .corecnte****       ****�j 0 numitems numItems�i 0 	alertname 	alertName�h 0 
alerttitle 
alertTitle�g 0 	alerttext 	alertText�f 
0 notify  
�e .misccurdldt    ��� null
�d 
time�c 0 currdate currDate�b  Q��a 0 	selectnum 	selectNum�` 0 
successtot 
successTot�_ 0 autosave  
�^ 
valL�] 0 selecteditem selectedItem�\ 0 tomorrow  �[ 0 	succeeded  
�Z 
TEXT�t!�*�k/
*�k/�[�,\Zk81 �*�,�-E�O��-j 	E�O�j   �E�O�E�O�E` O)��_ m+ OhY hO*j *j a ,E` O_ a E` O�E` OjE` OfE` O Jh_ j��_ /a ,E` O)_ _ l+ E` O_  _ kE` Y hO_ kE` [OY��OeE` Oa E�Oa E�O_ k a Ec  Y hO_ a  %b  %a !%a "&E` UUO)��_ m+ U ascr  ��ޭ