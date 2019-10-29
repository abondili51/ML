import numpy as np
import cv2

face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

#feed = cv2.VideoCapture(0)
img = cv2.imread('pic.jpg')#,cv2.IMREAD_GRAYSCALE)

#while 1:
#_, img = feed.read()
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
faces = face_cascade.detectMultiScale(gray, 1.3, 5)

for (x,y,w,h) in faces:
	cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
	roi_gray = gray[y:y+h, x:x+w]
	roi_color = img[y:y+h, x:x+w]
	
cv2.imwrite('FaceDetection_OUTPUT.jpg',img)
k = cv2.waitKey(30) & 0xff
#if k == 27:
	#break

#feed.release()
cv2.destroyAllWindows()
