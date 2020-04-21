import cv2
import requests
import numpy as np
from PIL import Image

# Tiny test application to check that everything is working fine

def get_mask(frame, bodypix_url='http://localhost:9000'):
    _, data = cv2.imencode(".jpg", frame)
    r = requests.post(
        url=bodypix_url,
        data=data.tobytes(),
        headers={'Content-Type': 'application/octet-stream'})
    mask = np.frombuffer(r.content, dtype=np.uint8)
    mask = mask.reshape((frame.shape[0], frame.shape[1]))
    return mask

# setup access to the *real* webcam
cap = cv2.VideoCapture('/dev/video0')
success, frame = cap.read()
cv2.imwrite('/image.jpg', frame)

mask = get_mask(frame)
mask = np.where(mask==1, 255, mask)

cv2.imwrite('/mask.jpg', mask)
