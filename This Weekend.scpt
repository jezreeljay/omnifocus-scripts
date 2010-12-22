FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��	# DESCRIPTION #
	
	This script takes the currently selected actions or projects and sets them to start and finish on the coming weekend. (If a weekend is currently in progress, the items will be set for the current weekend.)
	
	The dates and times are set by variables, so you can modify to meet your weekend.		# LICENSE #

	Copyright � 2010 Dan Byler (contact: dbyler@gmail.com)
	Licensed under MIT License (http://www.opensource.org/licenses/mit-license.php)		# CHANGE HISTORY #

	0.1c (2010-06-22)
		-	Actual fix for autosave

	0.1b (2010-06-21)
		-	Encapsulated autosave in "try" statements in case this fails
	0.1: Initial release. Based on my Defer script, which incorporates bug fixes from Curt Clifton. By default, notifications are disabled (uncomment the appropriate lines to enable them).

	# INSTALLATION #	1. Copy to ~/Library/Scripts/Applications/Omnifocus 	2. If desired, add to the OmniFocus toolbar using View > Customize Toolbar... within OmniFocus	# KNOWN BUGS #
		- When the script is invoked from the OmniFocus toolbar and canceled, OmniFocus returns an error. This issue does not occur when invoked from the script menu, a Quicksilver trigger, etc.		     � 	 		N  	 #   D E S C R I P T I O N   # 
 	 
 	 T h i s   s c r i p t   t a k e s   t h e   c u r r e n t l y   s e l e c t e d   a c t i o n s   o r   p r o j e c t s   a n d   s e t s   t h e m   t o   s t a r t   a n d   f i n i s h   o n   t h e   c o m i n g   w e e k e n d .   ( I f   a   w e e k e n d   i s   c u r r e n t l y   i n   p r o g r e s s ,   t h e   i t e m s   w i l l   b e   s e t   f o r   t h e   c u r r e n t   w e e k e n d . ) 
 	 
 	 T h e   d a t e s   a n d   t i m e s   a r e   s e t   b y   v a r i a b l e s ,   s o   y o u   c a n   m o d i f y   t o   m e e t   y o u r   w e e k e n d .  	  	 #   L I C E N S E   # 
 
 	 C o p y r i g h t   �   2 0 1 0   D a n   B y l e r   ( c o n t a c t :   d b y l e r @ g m a i l . c o m ) 
 	 L i c e n s e d   u n d e r   M I T   L i c e n s e   ( h t t p : / / w w w . o p e n s o u r c e . o r g / l i c e n s e s / m i t - l i c e n s e . p h p )  	   	 #   C H A N G E   H I S T O R Y   #  
 
 	 0 . 1 c   ( 2 0 1 0 - 0 6 - 2 2 ) 
 	 	 - 	 A c t u a l   f i x   f o r   a u t o s a v e 
 
 	 0 . 1 b   ( 2 0 1 0 - 0 6 - 2 1 ) 
 	 	 - 	 E n c a p s u l a t e d   a u t o s a v e   i n   " t r y "   s t a t e m e n t s   i n   c a s e   t h i s   f a i l s 
  	 0 . 1 :   I n i t i a l   r e l e a s e .   B a s e d   o n   m y   D e f e r   s c r i p t ,   w h i c h   i n c o r p o r a t e s   b u g   f i x e s   f r o m   C u r t   C l i f t o n .   B y   d e f a u l t ,   n o t i f i c a t i o n s   a r e   d i s a b l e d   ( u n c o m m e n t   t h e   a p p r o p r i a t e   l i n e s   t o   e n a b l e   t h e m ) .  
 
  	 #   I N S T A L L A T I O N   #   	 1 .   C o p y   t o   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / O m n i f o c u s    	 2 .   I f   d e s i r e d ,   a d d   t o   t h e   O m n i F o c u s   t o o l b a r   u s i n g   V i e w   >   C u s t o m i z e   T o o l b a r . . .   w i t h i n   O m n i F o c u s   	 #   K N O W N   B U G S   # 
 	  	 -   W h e n   t h e   s c r i p t   i s   i n v o k e d   f r o m   t h e   O m n i F o c u s   t o o l b a r   a n d   c a n c e l e d ,   O m n i F o c u s   r e t u r n s   a n   e r r o r .   T h i s   i s s u e   d o e s   n o t   o c c u r   w h e n   i n v o k e d   f r o m   t h e   s c r i p t   m e n u ,   a   Q u i c k s i l v e r   t r i g g e r ,   e t c .  	 	    
  
 l     ��������  ��  ��        l     ��  ��    S M To change your weekend start/stop date/time, modify the following properties     �   �   T o   c h a n g e   y o u r   w e e k e n d   s t a r t / s t o p   d a t e / t i m e ,   m o d i f y   t h e   f o l l o w i n g   p r o p e r t i e s      j     �� �� 0 
westartday 
weStartDay  m     ��
�� 
fri       l          j    �� �� 0 westarttime weStartTime  m    ����   # due time in hrs (24 hr clock)     �   : d u e   t i m e   i n   h r s   ( 2 4   h r   c l o c k )      j    �� �� 0 weendday weEndDay  m    ��
�� 
sun       l        ! "   j   	 �� #�� 0 	weendtime 	weEndTime # m   	 
����  ! % due time in hours (24 hr clock)    " � $ $ > d u e   t i m e   i n   h o u r s   ( 2 4   h r   c l o c k )   % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) E ?To enable alerts, change these settings to True _and_ uncomment    * � + + ~ T o   e n a b l e   a l e r t s ,   c h a n g e   t h e s e   s e t t i n g s   t o   T r u e   _ a n d _   u n c o m m e n t (  , - , l      . / 0 . j    �� 1�� 0 	showalert 	showAlert 1 m    ��
�� boovfals / 2 ,if true, will display success/failure alerts    0 � 2 2 X i f   t r u e ,   w i l l   d i s p l a y   s u c c e s s / f a i l u r e   a l e r t s -  3 4 3 l      5 6 7 5 j    �� 8�� 0 usegrowl useGrowl 8 m    ��
�� boovtrue 6 8 2if true, will use Growl for success/failure alerts    7 � 9 9 d i f   t r u e ,   w i l l   u s e   G r o w l   f o r   s u c c e s s / f a i l u r e   a l e r t s 4  : ; : l     ��������  ��  ��   ;  < = < l     �� > ?��   >   Don't change these    ? � @ @ &   D o n ' t   c h a n g e   t h e s e =  A B A j    �� C�� 0 alertitemnum alertItemNum C m     D D � E E   B  F G F j    �� H�� 0 alertdaynum alertDayNum H m     I I � J J   G  K L K j    �� M�� 0 duedate dueDate M m     N N � O O   L  P Q P j    �� R�� 0 growlappname growlAppName R m     S S � T T  D a n ' s   S c r i p t s Q  U V U j     )�� W�� $0 allnotifications allNotifications W J     ( X X  Y Z Y m     # [ [ � \ \  G e n e r a l Z  ]�� ] m   # & ^ ^ � _ _ 
 E r r o r��   V  ` a ` j   * 3�� b�� ,0 enablednotifications enabledNotifications b J   * 2 c c  d e d m   * - f f � g g  G e n e r a l e  h�� h m   - 0 i i � j j 
 E r r o r��   a  k l k j   4 8�� m�� "0 iconapplication iconApplication m m   4 7 n n � o o  O m n i F o c u s . a p p l  p q p l     ��������  ��  ��   q  r s r l   � t���� t O    � u v u k   � w w  x y x O   � z { z O   � | } | k   � ~ ~   �  r    " � � � n      � � � 2    ��
�� 
OTst � 1    ��
�� 
FCcn � o      ���� $0 theselecteditems theSelectedItems �  � � � r   # , � � � l  # * ����� � I  # *�� ���
�� .corecnte****       **** � n   # & � � � 2  $ &��
�� 
cobj � o   # $���� $0 theselecteditems theSelectedItems��  ��  ��   � o      ���� 0 numitems numItems �  � � � Z   - B � ����� � =  - 0 � � � o   - .���� 0 numitems numItems � m   . /����   � k   3 > � �  � � � n  3 ; � � � I   4 ;�� ����� 
0 notify   �  � � � m   4 5 � � � � � 
 E r r o r �  � � � m   5 6 � � � � �  S c r i p t   f a i l u r e �  ��� � m   6 7 � � � � � 2 N o   v a l i d   t a s k ( s )   s e l e c t e d��  ��   �  f   3 4 �  ��� � L   < >����  ��  ��  ��   �  � � � l  C C��������  ��  ��   �  � � � l  C C�� � ���   �  Calculate due date    � � � � $ C a l c u l a t e   d u e   d a t e �  � � � r   C N � � � I  C H������
�� .misccurdldt    ��� null��  ��   � o      ���� 0 duedate dueDate �  � � � r   O \ � � � n   O X � � � 1   T X��
�� 
time � o   O T���� 0 duedate dueDate � o      ���� 0 thetime theTime �  � � � V   ] � � � � r   q � � � � [   q | � � � o   q v���� 0 duedate dueDate � ]   v { � � � m   v w����  � 1   w z��
�� 
days � o      ���� 0 duedate dueDate � >  a p � � � n   a j � � � m   f j��
�� 
wkdy � o   a f���� 0 duedate dueDate � o   j o���� 0 weendday weEndDay �  � � � r   � � � � � [   � � � � � \   � � � � � o   � ����� 0 duedate dueDate � o   � ����� 0 thetime theTime � ]   � � � � � o   � ����� 0 	weendtime 	weEndTime � 1   � ���
�� 
hour � o      ���� 0 duedate dueDate �  � � � l  � ��� � ���   � R Lset dueDate to dueDate + 1 * weeks --uncomment to use _next_ weekend instead    � � � � � s e t   d u e D a t e   t o   d u e D a t e   +   1   *   w e e k s   - - u n c o m m e n t   t o   u s e   _ n e x t _   w e e k e n d   i n s t e a d �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  Calculate start date    � � � � ( C a l c u l a t e   s t a r t   d a t e �  � � � r   � � � � � \   � � � � � o   � ����� 0 weendday weEndDay � o   � ����� 0 
westartday 
weStartDay � o      ���� 0 diff   �  � � � Z  � � � ����� � A   � � � � � o   � ����� 0 diff   � m   � �����   � r   � � � � � [   � � � � � o   � ����� 0 diff   � m   � �����  � o      ���� 0 diff  ��  ��   �  � � � r   � � � � � [   � � � � � ]   � � � � � o   � ����� 0 diff   � 1   � ���
�� 
days � ]   � � � � � l  � � ����� � \   � � � � � o   � ����� 0 	weendtime 	weEndTime � o   � ����� 0 westarttime weStartTime��  ��   � 1   � ���
�� 
hour � o      ���� 0 diff   �  � � � r   � � � � � \   � � � � � o   � ����� 0 duedate dueDate � o   � ����� 0 diff   � o      ���� 0 	startdate 	startDate �  � � � l  � ���������  ��  ��   �  �  � l  � �����    Perform action    �  P e r f o r m   a c t i o n   r   � � o   � ����� 0 numitems numItems o      ���� 0 	selectnum 	selectNum 	 r   � �

 m   � �����   o      ���� 0 
successtot 
successTot	  r    m   ��
�� boovfals o      ���� 0 autosave    V  V k  Q  r   n   1  ��
�� 
valL n   4  ��
�� 
cobj o  ���� 0 	selectnum 	selectNum o  ���� $0 theselecteditems theSelectedItems o      ���� 0 selecteditem selectedItem  r  3 !  n /"#" I   /��$���� 0 
changedate 
changeDate$ %&% o   #���� 0 selecteditem selectedItem& '(' o  #&���� 0 	startdate 	startDate( )��) o  &+�� 0 duedate dueDate��  ��  #  f   ! o      �~�~ 0 	succeeded   *+* Z 4G,-�}�|, o  47�{�{ 0 	succeeded  - r  :C./. [  :?010 o  :=�z�z 0 
successtot 
successTot1 m  =>�y�y / o      �x�x 0 
successtot 
successTot�}  �|  + 2�w2 r  HQ343 \  HM565 o  HK�v�v 0 	selectnum 	selectNum6 m  KL�u�u 4 o      �t�t 0 	selectnum 	selectNum�w   ?  
787 o  
�s�s 0 	selectnum 	selectNum8 m  �r�r   9:9 r  W\;<; m  WX�q
�q boovtrue< o      �p�p 0 autosave  : =>= l ]]�o�n�m�o  �n  �m  > ?@? l ]]�lAB�l  A + %Set up alert according to preferences   B �CC J S e t   u p   a l e r t   a c c o r d i n g   t o   p r e f e r e n c e s@ DED Z ]rFG�k�jF ?  ]bHIH o  ]`�i�i 0 
successtot 
successTotI m  `a�h�h G r  enJKJ m  ehLL �MM  sK o      �g�g 0 alertitemnum alertItemNum�k  �j  E N�fN r  s�OPO c  s�QRQ b  s�STS b  s�UVU b  szWXW o  sv�e�e 0 
successtot 
successTotX m  vyYY �ZZ 
   i t e mV o  z�d�d 0 alertitemnum alertItemNumT m  ��[[ �\\ ,   n o w   d u e   t h i s   w e e k e n d .R m  ���c
�c 
TEXTP o      �b�b 0 	alerttext 	alertText�f   } l   ]�a�`] 6   ^_^ 4   �_`
�_ 
FCdw` m    �^�^ _ =   aba 1    �]
�] 
pidxb m    �\�\ �a  �`   { 4   �[c
�[ 
docuc m    �Z�Z  y d�Yd n ��efe I  ���Xg�W�X 
0 notify  g hih m  ��jj �kk  G e n e r a li lml m  ��nn �oo  S c r i p t   c o m p l e t em p�Vp o  ���U�U 0 	alerttext 	alertText�V  �W  f  f  ���Y   v m     qq�                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  ��  ��   s rsr l     �T�S�R�T  �S  �R  s tut i   9 <vwv I      �Qx�P�Q 0 
changedate 
changeDatex yzy o      �O�O 0 selecteditem selectedItemz {|{ o      �N�N 0 	startdate 	startDate| }�M} o      �L�L 0 duedate dueDate�M  �P  w k     )~~ � r     ��� m     �K
�K boovfals� o      �J�J 0 success  � ��� O    $��� Q    #���I� k    �� ��� r    ��� o    �H�H 0 	startdate 	startDate� n      ��� 1    �G
�G 
FCDs� o    �F�F 0 selecteditem selectedItem� ��� r    ��� o    �E�E 0 duedate dueDate� n      ��� 1    �D
�D 
FCDd� o    �C�C 0 selecteditem selectedItem� ��B� r    ��� m    �A
�A boovtrue� o      �@�@ 0 success  �B  � R      �?�>�=
�? .ascrerr ****      � ****�>  �=  �I  � m    ���                                                                                  OFOC  alis    H  Progena                    ��ePH+     cOmniFocus.app                                                     ��3�        ����  	                Applications    ����      ��       c  "Progena:Applications:OmniFocus.app    O m n i F o c u s . a p p    P r o g e n a  Applications/OmniFocus.app  / ��  � ��<� L   % )�� J   % (�� ��;� o   % &�:�: 0 success  �;  �<  u ��� l     �9�8�7�9  �8  �7  � ��� i   = @��� I      �6��5�6 
0 notify  � ��� o      �4�4 0 	alertname 	alertName� ��� o      �3�3 0 
alerttitle 
alertTitle� ��2� o      �1�1 0 	alerttext 	alertText�2  �5  � Z     ������ =    ��� o     �0�0 0 	showalert 	showAlert� m    �/
�/ boovfals� L   
 �.�.  � ��� =   ��� o    �-�- 0 usegrowl useGrowl� m    �,
�, boovtrue� ��+� k    ��� ��� l   �*���*  � ) #check to make sure Growl is running   � ��� F c h e c k   t o   m a k e   s u r e   G r o w l   i s   r u n n i n g� ��� O   0��� r    /��� l   -��)�(� I   -�'��&
�' .corecnte****       ****� l   )��%�$� 6   )��� 2    �#
�# 
pcap� l  ! (��"�!� =  ! (��� 1   " $� 
�  
pnam� m   % '�� ���  G r o w l H e l p e r A p p�"  �!  �%  �$  �&  �)  �(  � o      �� 0 growlrunning GrowlRunning� m    ���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  � ��� Z   1 p����� =   1 4��� o   1 2�� 0 growlrunning GrowlRunning� m   2 3��  � k   7 l�� ��� l  7 7����  �  try to activate Growl   � ��� * t r y   t o   a c t i v a t e   G r o w l� ��� Q   7 N���� k   : E�� ��� I  : ?���
� .sysoexecTEXT���     TEXT� m   : ;�� ��� � / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�  � ��� I  @ E���
� .sysoexecTEXT���     TEXT� m   @ A�� ��� � ~ / L i b r a r y / P r e f e r e n c e P a n e s / G r o w l . p r e f P a n e / C o n t e n t s / R e s o u r c e s / G r o w l H e l p e r A p p . a p p / C o n t e n t s / M a c O S / G r o w l H e l p e r A p p   >   / d e v / n u l l   2 > & 1   &�  �  � R      ���
� .ascrerr ****      � ****�  �  �  � ��� I  O T���
� .sysodelanull��� ��� nmbr� m   O P�� ?ə������  � ��� O  U l��� r   Y k��� l  Y i���� I  Y i���

� .corecnte****       ****� l  Y e��	�� 6  Y e��� 2  Y \�
� 
pcap� l  ] d���� =  ] d��� 1   ^ `�
� 
pnam� m   a c�� ���  G r o w l H e l p e r A p p�  �  �	  �  �
  �  �  � o      �� 0 growlrunning GrowlRunning� m   U V���                                                                                  sevs  alis    �  Progena                    ��ePH+   t�System Events.app                                               �T�7��        ����  	                CoreServices    ����      �8'7     t� t�   k  5Progena:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P r o g e n a  -System/Library/CoreServices/System Events.app   / ��  �  �  �  � ��� l  q q����  �  notify   � ���  n o t i f y� ��� Z   q � �   @   q t o   q r���� 0 growlrunning GrowlRunning m   r s����  Q   w ��� O   z � k   ~ �		 

 I  ~ �����
�� .registernull��� ��� null��   ��
�� 
appl o   � ����� 0 growlappname growlAppName ��
�� 
anot o   � ����� $0 allnotifications allNotifications ��
�� 
dnot o   � ����� $0 allnotifications allNotifications ����
�� 
iapp o   � ����� "0 iconapplication iconApplication��   �� I  � �����
�� .notifygrnull��� ��� null��   ��
�� 
name o   � ����� 0 	alertname 	alertName ��
�� 
titl o   � ����� 0 
alerttitle 
alertTitle ��
�� 
appl o   � ����� 0 growlappname growlAppName ����
�� 
desc o   � ����� 0 	alerttext 	alertText��  ��   m   z {"                                                                                  GRRR  alis    �  Progena                    ��ePH+   |9GrowlHelperApp.app                                              |;���         ����  	                	Resources     ����      ��6p     |9 |7 {� ?�   i  TProgena:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    P r o g e n a  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   R      ������
�� .ascrerr ****      � ****��  ��  ��  �    k   � �   r   � �!"! b   � �#$# o   � ����� 0 	alerttext 	alertText$ m   � �%% �&& �       p . s .   D o n ' t   w o r r y  t h e   G r o w l   n o t i f i c a t i o n   f a i l e d   b u t   t h e   s c r i p t   w a s   s u c c e s s f u l ." o      ���� 0 	alerttext 	alertText  '��' I  � ���()
�� .sysodlogaskr        TEXT( o   � ����� 0 	alerttext 	alertText) ��*��
�� 
disp* m   � ����� ��  ��  �  �+  � I  � ���+,
�� .sysodlogaskr        TEXT+ o   � ����� 0 	alerttext 	alertText, ��-��
�� 
disp- m   � ����� ��  � .��. l     ��������  ��  ��  ��       ��/������������ D I N S01 n234��  / ���������������������������������� 0 
westartday 
weStartDay�� 0 westarttime weStartTime�� 0 weendday weEndDay�� 0 	weendtime 	weEndTime�� 0 	showalert 	showAlert�� 0 usegrowl useGrowl�� 0 alertitemnum alertItemNum�� 0 alertdaynum alertDayNum�� 0 duedate dueDate�� 0 growlappname growlAppName�� $0 allnotifications allNotifications�� ,0 enablednotifications enabledNotifications�� "0 iconapplication iconApplication�� 0 
changedate 
changeDate�� 
0 notify  
�� .aevtoappnull  �   � ****
�� 
fri �� 
�� 
sun �� 
�� boovfals
�� boovtrue0 ��5�� 5   [ ^1 ��6�� 6   f i2 ��w����78���� 0 
changedate 
changeDate�� ��9�� 9  �������� 0 selecteditem selectedItem�� 0 	startdate 	startDate�� 0 duedate dueDate��  7 ���������� 0 selecteditem selectedItem�� 0 	startdate 	startDate�� 0 duedate dueDate�� 0 success  8 ���������
�� 
FCDs
�� 
FCDd��  ��  �� *fE�O�  ���,FO���,FOeE�W X  hUO�kv3 �������:;���� 
0 notify  �� ��<�� <  �������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText��  : ���������� 0 	alertname 	alertName�� 0 
alerttitle 
alertTitle�� 0 	alerttext 	alertText�� 0 growlrunning GrowlRunning; ���=�������������������������������������%����
�� 
pcap=  
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
�� .sysodlogaskr        TEXT�� �b  f  hY �b  e  �� *�-�[�,\Z�81j E�UO�j  : �j O�j W X 	 
hO�j O� *�-�[�,\Z�81j E�UY hO�k U I� A*�b  	a b  
a b  
a b  a  O*a �a ��b  	a �a  UW X 	 
hY �a %E�O�a kl Y �a kl 4 ��>����?@��
�� .aevtoappnull  �   � ****> k    �AA  r����  ��  ��  ?  @ &q����=��������~�}�| � � ��{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�kLY[�j�ijn
�� 
docu
�� 
FCdw
�� 
pidx
�� 
FCcn
�� 
OTst� $0 theselecteditems theSelectedItems
�~ 
cobj
�} .corecnte****       ****�| 0 numitems numItems�{ 
0 notify  
�z .misccurdldt    ��� null
�y 
time�x 0 thetime theTime
�w 
wkdy
�v 
days
�u 
hour�t 0 diff  �s �r 0 	startdate 	startDate�q 0 	selectnum 	selectNum�p 0 
successtot 
successTot�o 0 autosave  
�n 
valL�m 0 selecteditem selectedItem�l 0 
changedate 
changeDate�k 0 	succeeded  
�j 
TEXT�i 0 	alerttext 	alertText�����*�k/�*�k/�[�,\Zk81s*�,�-E�O��-j 	E�O�j  )���m+ OhY hO*j Ec  Ob  a ,E` O )hb  a ,b  b  k_  Ec  [OY��Ob  _ b  _  Ec  Ob  b   E` O_ j _ a E` Y hO_ _  b  b  _  E` Ob  _ E` O�E` OjE` OfE` O Oh_ j��_ /a ,E` O)_ _ b  m+ E` O_  _ kE` Y hO_ kE` [OY��OeE` O_ k a Ec  Y hO_ a  %b  %a !%a "&E` #UUO)a $a %_ #m+ U ascr  ��ޭ