
# Signal and Systems Final Project Report

## Project Title: Visual Saliency Detection Based on Human Attention Mechanism

### 1. Project Purpose

This project simulates the mechanism of human visual attention using a computational model. By mimicking how the human visual system distinguishes salient regions in an image, the algorithm enables machines to focus on significant parts automatically.

### 2. Development Tools

- MATLAB R2020b or newer
- Image Processing Toolbox
- Custom scripts (`normalizeImage.m`, `mygaborfilter.m`)

### 3. Core Algorithm Steps

1. **Image Preprocessing**:
   - Gaussian filtering
   - Downsampling to multiple scales

2. **Feature Extraction**:
   - RGB color separation and opponency calculation (RG/BY)
   - Intensity grayscale conversion
   - Gabor orientation filtering at 0°, 45°, 90°, and 135°

3. **Feature Fusion**:
   - Normalization of feature maps
   - Linear combination to generate saliency map

### 4. Results

- The saliency map highlights attention-grabbing regions in the original image.
- Outputs include intermediate maps: filtered image, intensity, RG/BY channels, and the final saliency result.

### 5. Conclusion

This project demonstrates the feasibility of implementing a simplified visual saliency detection model in MATLAB. It provides a foundation for further work in image segmentation, object detection, or robotic vision.

---

Author: Haoran Wang  
Institution: University of Jinan  
Course: Signals and Systems  
Date: June 2017
