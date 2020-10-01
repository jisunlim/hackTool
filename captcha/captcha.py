import cv2
from PIL import Image, ImageSequence
import pytesseract
import os

gif = input("gif name: ") + '.gif'
img = Image.open(gif)

index = 1
for frame in ImageSequence.Iterator(img):
    # gif to png
    frame.save("frame%d.png" % index)

    # 이미지 처리
    im_gray = cv2.imread("frame%d.png" % index, cv2.IMREAD_GRAYSCALE)
    (thresh, im_bw) = cv2.threshold(im_gray, 127, 255, cv2.THRESH_TRUNC | cv2.THRESH_TRIANGLE)
    # cv2.imwrite("bw_img%d.png" % index, im_bw)

    # 텍스트 추출
    text = pytesseract.image_to_string(im_bw, lang='eng', config="--psm 10 --oem 3")
    print(text)
    os.remove("frame%d.png" % index)
    # os.remove("bw_img%d.png" % index, im_bw)

    index += 1
