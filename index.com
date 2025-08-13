<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PK HD - Professional Photo HD Converter</title>
    <style>
        :root {
            --primary-color: #4a00e0;
            --secondary-color: #8e2de2;
            --accent-color: #ff6b6b;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--light-color);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            text-align: center;
            margin-bottom: 40px;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .logo-img {
            width: 60px;
            height: 60px;
            margin-right: 15px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .logo-text {
            font-size: 2.5rem;
            font-weight: bold;
            background: linear-gradient(to right, #ff8a00, #e52e71);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        
        .tagline {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .main-content {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .upload-section {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .upload-box {
            border: 2px dashed rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            padding: 40px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        
        .upload-box:hover {
            border-color: var(--accent-color);
            background-color: rgba(255, 255, 255, 0.05);
        }
        
        .upload-icon {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--accent-color);
        }
        
        .file-input {
            display: none;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(to right, var(--accent-color), #ff8e53);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }
        
        .btn:active {
            transform: translateY(1px);
        }
        
        .btn-secondary {
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }
        
        .options-section {
            margin: 30px 0;
        }
        
        .options-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .option-card {
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .option-card:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-5px);
        }
        
        .option-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: var(--accent-color);
        }
        
        .preview-section {
            margin: 40px 0;
            display: none;
        }
        
        .preview-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 20px;
        }
        
        .image-box {
            width: 300px;
            height: 300px;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .image-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .image-label {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        
        /* About Section */
        .about-section {
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            margin: 40px 0;
        }
        
        .about-content {
            display: flex;
            align-items: center;
            gap: 30px;
            flex-wrap: wrap;
        }
        
        .about-text {
            flex: 1;
            min-width: 300px;
        }
        
        .about-image {
            flex: 1;
            min-width: 300px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .about-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        /* Ad Sections */
        .ad-container {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 30px 0;
            text-align: center;
            border: 1px dashed rgba(255, 255, 255, 0.3);
        }
        
        .ad-label {
            font-size: 0.8rem;
            opacity: 0.7;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        footer {
            text-align: center;
            margin-top: 50px;
            padding: 20px;
            opacity: 0.8;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .logo-text {
                font-size: 2rem;
            }
            
            .preview-container {
                flex-direction: column;
                align-items: center;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 300px;
            }
            
            .about-content {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo-container">
                <img src="https://via.placeholder.com/150/4a00e0/ffffff?text=PK+HD" alt="PK HD Logo" class="logo-img">
                <div class="logo-text">PK HD</div>
            </div>
            <div class="tagline">Transform Your Photos into Stunning HD Quality with Our Advanced AI Technology</div>
        </header>
        
        <!-- Top Ad Banner -->
        <div class="ad-container">
            <div class="ad-label">Advertisement</div>
            <!-- Replace this with your actual ad code -->
            <div id="top-banner-ad" style="min-height: 90px; background: rgba(255,255,255,0.2); display: flex; align-items: center; justify-content: center; border-radius: 5px;">
                <p>Your Ad Here (728x90)</p>
            </div>
        </div>
        
        <div class="main-content">
            <div class="upload-section">
                <h2>Upload Your Photo</h2>
                <p>Select an image to convert to HD quality</p>
                
                <div class="upload-box" id="uploadBox">
                    <div class="upload-icon">📁</div>
                    <p>Click to browse or drag & drop your image</p>
                    <input type="file" id="fileInput" class="file-input" accept="image/*">
                </div>
                
                <button class="btn" id="uploadBtn">Select Image</button>
            </div>
            
            <!-- Middle Ad Banner -->
            <div class="ad-container">
                <div class="ad-label">Advertisement</div>
                <!-- Replace this with your actual ad code -->
                <div id="middle-banner-ad" style="min-height: 250px; background: rgba(255,255,255,0.2); display: flex; align-items: center; justify-content: center; border-radius: 5px;">
                    <p>Your Ad Here (300x250)</p>
                </div>
            </div>
            
            <div class="options-section">
                <h2>HD Conversion Options</h2>
                <p>Choose your preferred enhancement settings</p>
                
                <div class="options-grid">
                    <div class="option-card">
                        <div class="option-icon">🖼️</div>
                        <h3>Standard HD</h3>
                        <p>Basic quality enhancement</p>
                    </div>
                    
                    <div class="option-card">
                        <div class="option-icon">✨</div>
                        <h3>Premium HD</h3>
                        <p>Advanced sharpening and detail</p>
                    </div>
                    
                    <div class="option-card">
                        <div class="option-icon">🎨</div>
                        <h3>Color Boost</h3>
                        <p>Vibrant color enhancement</p>
                    </div>
                    
                    <div class="option-card">
                        <div class="option-icon">🔍</div>
                        <h3>Ultra Detail</h3>
                        <p>Maximum detail recovery</p>
                    </div>
                </div>
            </div>
            
            <div class="preview-section" id="previewSection">
                <h2>Preview</h2>
                <p>Compare original and HD versions</p>
                
                <div class="preview-container">
                    <div class="image-box">
                        <img id="originalImage" src="" alt="Original Image">
                        <div class="image-label">Original</div>
                    </div>
                    
                    <div class="image-box">
                        <img id="hdImage" src="" alt="HD Image">
                        <div class="image-label">HD Version</div>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <button class="btn" id="convertBtn">Convert to HD</button>
                    <button class="btn btn-secondary" id="downloadBtn">Download HD Image</button>
                </div>
            </div>
        </div>
        
        <!-- About Section -->
        <div class="about-section">
            <h2>About PK HD</h2>
            <div class="about-content">
                <div class="about-text">
                    <p>PK HD is a revolutionary photo enhancement platform that uses advanced artificial intelligence to transform your ordinary photos into stunning high-definition masterpieces.</p>
                    <p>Our technology was developed by a team of image processing experts with over 10 years of experience in computer vision and machine learning.</p>
                    <p>Whether you're a professional photographer looking to enhance your portfolio or just someone who wants to improve old family photos, PK HD provides the tools you need to bring your images to life.</p>
                    <p>The service is completely free to use, supported by non-intrusive advertisements that help us maintain and improve our technology.</p>
                </div>
                <div class="about-image">
                    <img src="https://via.placeholder.com/600x400/8e2de2/ffffff?text=PK+HD+Team" alt="PK HD Team">
                </div>
            </div>
        </div>
        
        <!-- Bottom Ad Banner -->
        <div class="ad-container">
            <div class="ad-label">Advertisement</div>
            <!-- Replace this with your actual ad code -->
            <div id="bottom-banner-ad" style="min-height: 90px; background: rgba(255,255,255,0.2); display: flex; align-items: center; justify-content: center; border-radius: 5px;">
                <p>Your Ad Here (728x90)</p>
            </div>
        </div>
    </div>
    
    <footer>
        <p>© 2023 PK HD - All Rights Reserved</p>
        <p>Convert your photos to stunning HD quality with our advanced technology</p>
    </footer>
    
    <script>
        // DOM Elements
        const uploadBox = document.getElementById('uploadBox');
        const uploadBtn = document.getElementById('uploadBtn');
        const fileInput = document.getElementById('fileInput');
        const previewSection = document.getElementById('previewSection');
        const originalImage = document.getElementById('originalImage');
        const hdImage = document.getElementById('hdImage');
        const convertBtn = document.getElementById('convertBtn');
        const downloadBtn = document.getElementById('downloadBtn');
        
        // Event Listeners
        uploadBtn.addEventListener('click', () => fileInput.click());
        uploadBox.addEventListener('click', () => fileInput.click());
        
        uploadBox.addEventListener('dragover', (e) => {
            e.preventDefault();
            uploadBox.style.borderColor = '#ff6b6b';
            uploadBox.style.backgroundColor = 'rgba(255, 255, 255, 0.1)';
        });
        
        uploadBox.addEventListener('dragleave', () => {
            uploadBox.style.borderColor = 'rgba(255, 255, 255, 0.3)';
            uploadBox.style.backgroundColor = 'transparent';
        });
        
        uploadBox.addEventListener('drop', (e) => {
            e.preventDefault();
            uploadBox.style.borderColor = 'rgba(255, 255, 255, 0.3)';
            uploadBox.style.backgroundColor = 'transparent';
            
            if (e.dataTransfer.files.length) {
                fileInput.files = e.dataTransfer.files;
                handleFileSelect();
            }
        });
        
        fileInput.addEventListener('change', handleFileSelect);
        
        convertBtn.addEventListener('click', convertToHD);
        downloadBtn.addEventListener('click', downloadHDImage);
        
        // Functions
        function handleFileSelect() {
            const file = fileInput.files[0];
            if (!file) return;
            
            if (!file.type.match('image.*')) {
                alert('Please select an image file.');
                return;
            }
            
            const reader = new FileReader();
            
            reader.onload = function(e) {
                originalImage.src = e.target.result;
                hdImage.src = e.target.result; // Initially same as original
                previewSection.style.display = 'block';
                
                // Scroll to preview section
                previewSection.scrollIntoView({ behavior: 'smooth' });
                
                // Track file upload for analytics (for ad revenue)
                trackConversion('file_upload');
            };
            
            reader.readAsDataURL(file);
        }
        
        function convertToHD() {
            if (!fileInput.files.length) {
                alert('Please select an image first.');
                return;
            }
            
            convertBtn.disabled = true;
            convertBtn.textContent = 'Processing...';
            
            // Track conversion for analytics (for ad revenue)
            trackConversion('conversion_start');
            
            // Simulate HD conversion (in a real app, this would call your backend)
            setTimeout(() => {
                // This is just a simulation - in reality you'd process the image
                hdImage.src = originalImage.src;
                
                convertBtn.disabled = false;
                convertBtn.textContent = 'Convert to HD';
                
                // Enable download button
                downloadBtn.disabled = false;
                
                alert('Image successfully converted to HD!');
                
                // Track successful conversion for analytics
                trackConversion('conversion_complete');
            }, 2000);
        }
        
        function downloadHDImage() {
            if (!fileInput.files.length || hdImage.src === '') {
                alert('No HD image to download.');
                return;
            }
            
            // Track download for analytics (for ad revenue)
            trackConversion('download');
            
            // Create a temporary link to download the image
            const link = document.createElement('a');
            link.href = hdImage.src;
            link.download = 'hd_' + fileInput.files[0].name;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
        
        // Function to track user actions for ad revenue
        function trackConversion(action) {
            // In a real implementation, this would send data to your analytics platform
            console.log(`Tracking: ${action}`);
            
            // Example: This is where you would implement Google AdSense event tracking
            // gtag('event', action, {
            //     'event_category': 'engagement',
            //     'event_label': 'hd_conversion'
            // });
        }
        
        // Initialize ads (this would be replaced with your actual ad code)
        window.addEventListener('load', function() {
            // Simulate ad loading
            setTimeout(() => {
                console.log('Ads loaded');
                // This is where you would initialize your ad network code
            }, 1000);
        });
    </script>
</body>
</html>
