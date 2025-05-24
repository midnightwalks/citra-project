function varargout = projectcitra(varargin)
% PROJECTCITRA MATLAB code for projectcitra.fig
%      PROJECTCITRA, by itself, creates a new PROJECTCITRA or raises the existing
%      singleton*.
%
%      H = PROJECTCITRA returns the handle to a new PROJECTCITRA or the handle to
%      the existing singleton*.
%
%      PROJECTCITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTCITRA.M with the given input arguments.
%
%      PROJECTCITRA('Property','Value',...) creates a new PROJECTCITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectcitra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectcitra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectcitra

% Last Modified by GUIDE v2.5 08-Nov-2024 10:27:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projectcitra_OpeningFcn, ...
                   'gui_OutputFcn',  @projectcitra_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before projectcitra is made visible.
function projectcitra_OpeningFcn(hObject, eventdata, handles, varargin)
% Initialize the undo and redo stacks
    handles.undoStack = {};  % Initialize undo stack
    handles.redoStack = {};  % Initialize redo stack
    
    % Initialize any other variables or GUI components
    guidata(hObject, handles);  % Save updated handles
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectcitra (see VARARGIN)

% Choose default command line output for projectcitra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projectcitra wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = projectcitra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Periksa apakah gambar berwarna, jika iya, konversi ke grayscale
if size(handles.im, 3) == 3
    G = rgb2gray(handles.im);  % Ubah ke grayscale
else
    G = handles.im;  % Jika sudah grayscale
end

% Tampilkan gambar grayscale di axes yang sudah disediakan
axes(handles.imageProcessed);  % Akses area untuk gambar terproses
imshow(G);  % Tampilkan gambar yang sudah diproses

% Update gambar terproses di handles.im
handles.im = G;

% Simpan handles terbaru
guidata(hObject, handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Create a negative of the image
negativeImage = imcomplement(handles.im);

% Display the negative image
axes(handles.imageProcessed);
imshow(negativeImage);

% Update the processed image in handles
handles.im = negativeImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Convert the image to black and white (binary image)
bwImage = imbinarize(rgb2gray(handles.im));  % Convert to binary (black and white)

% Display the binary image
axes(handles.imageProcessed);
imshow(bwImage);

% Update the processed image in handles
handles.im = bwImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Apply smoothing using a Gaussian filter
smoothedImage = imgaussfilt(handles.im, 2);  % Gaussian filter with sigma = 2

% Display the smoothed image
axes(handles.imageProcessed);
imshow(smoothedImage);

% Update the processed image in handles
handles.im = smoothedImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Rotate the image by 90 degrees
rotatedImage = imrotate(handles.im, 90);

% Display the rotated image
axes(handles.imageProcessed);
imshow(rotatedImage);

% Update the processed image in handles
handles.im = rotatedImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Apply sharpening to the image
sharpenedImage = imsharpen(handles.im);

% Display the sharpened image
axes(handles.imageProcessed);
imshow(sharpenedImage);

% Update the processed image in handles
handles.im = sharpenedImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Apply blurring using a simple averaging filter
blurredImage = imgaussfilt(handles.im, 5);  % Gaussian filter with sigma = 5 for more blur

% Display the blurred image
axes(handles.imageProcessed);
imshow(blurredImage);

% Update the processed image in handles
handles.im = blurredImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Perform edge detection using the Sobel method
edgeImage = edge(rgb2gray(handles.im), 'Sobel');

% Display the edge-detected image
axes(handles.imageProcessed);
imshow(edgeImage);

% Update the processed image in handles
handles.im = edgeImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Periksa apakah gambar grayscale atau RGB
if size(handles.im, 3) == 3
    imGray = rgb2gray(handles.im);  % Jika RGB, ubah ke grayscale
else
    imGray = handles.im;  % Jika sudah grayscale, gunakan langsung
end

% Hitung histogram equalization secara manual (tanpa toolbox)
numBins = 256;  % Untuk gambar 8-bit
pixelCounts = zeros(1, numBins);  % Inisialisasi histogram dengan 0
[m, n] = size(imGray);  % Dapatkan dimensi gambar

% Hitung frekuensi tiap level intensitas
for i = 1:m
    for j = 1:n
        intensity = imGray(i, j) + 1;  % Intensitas dari 0-255
        pixelCounts(intensity) = pixelCounts(intensity) + 1;
    end
end

% Hitung CDF (Cumulative Distribution Function)
cdf = cumsum(pixelCounts) / numel(imGray);

% Remap nilai pixel lama ke nilai pixel baru (equalized)
imEq = zeros(m, n, 'uint8');
for i = 1:m
    for j = 1:n
        imEq(i, j) = uint8(255 * cdf(imGray(i, j) + 1));  % Mapping pixel values
    end
end

% Tampilkan gambar yang sudah di-equalized di axes
axes(handles.imageProcessed);  % Akses area untuk gambar terproses
imshow(imEq);  % Tampilkan gambar hasil equalization

% Update gambar terproses di handles.im
handles.im = imEq;

% Simpan handles terbaru
guidata(hObject, handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Flip the image vertically
flippedImage = flipud(handles.im);  % Flip image upside down

% Display the flipped image
axes(handles.imageProcessed);
imshow(flippedImage);

% Update the processed image in handles
handles.im = flippedImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
[FileName, PathName] = uigetfile({'*.jpg;*.png;*.jpeg', 'Pilih Citra JPG'});
    if FileName ~= 0  % Check if the user has selected a file
        im = imread([PathName, FileName]);
        
        % Set the current image to the loaded one
        handles.im = im;  
        handles.original_im = im;  % Store the original image in handles
        
        % Get original image dimensions
        [height, width, ~] = size(im);
        
        % Display original dimensions in w_ori and h_ori edit text fields
        set(handles.w_ori, 'String', num2str(width));  % Set width in w_ori
        set(handles.h_ori, 'String', num2str(height)); % Set height in h_ori
        
        % Update handles structure
        guidata(hObject, handles);
        
        % Display the raw image in the raw image axes
        axes(handles.imageRaw);
        imshow(im);
        
        % Optional: Clear the processed image axes (just in case)
        cla(handles.imageProcessed);  % Clear the processed image area
    end
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

% Flip the image horizontally
flippedImage = fliplr(handles.im);  % Flip image left to right

% Display the flipped image
axes(handles.imageProcessed);
imshow(flippedImage);

% Update the processed image in handles
handles.im = flippedImage;
guidata(hObject, handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
thresh = handles.im;
[name_file_save, path_save] = uiputfile({ ...
    '*.bmp', 'File Bitmap (*.bmp)'; ...
    '*.jpg', 'File jpeg (*.jpg)'; ...
    '*.png', 'File png (*.png)'; ...
    '*.tif', 'File Tif (*.tif)'; ...
    '*.*', 'All Files (*.*)'}, ...
    'Save Image');

if ~isequal(name_file_save, 0)
    imwrite(thresh, fullfile(path_save, name_file_save));
else
    return
end
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function proses_Callback(hObject, eventdata, handles)
set(handles.panelProses, 'visible', 'on');
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% Cek apakah field 'original_im' ada dan sudah di-set
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        % Reset gambar ke gambar asli dan tampilkan di imageProcessed
        handles.im = handles.original_im;  % Kembalikan gambar asli ke handles.im
        axes(handles.imageProcessed);
        imshow(handles.im);  % Tampilkan gambar asli di axes untuk processed image
        
        % Kosongkan axes untuk processed image jika perlu
        cla(handles.imageProcessed);  % Kosongkan gambar yang sudah diproses jika perlu
        
        set(handles.adj_brightness, 'Value', 0);
        set(handles.adj_contrast, 'Value', 0);
        set(handles.adj_clarity, 'Value', 0);
        set(handles.adj_saturation, 'Value', 0);
        set(handles.adj_hue, 'Value', 0);
        set(handles.adj_shadows, 'Value', 0);
        set(handles.adj_highlights, 'Value', 0);
        set(handles.adj_temperature, 'Value', 0);
        set(handles.slider_red, 'Value', 0);
        set(handles.slider_green, 'Value', 0);
        set(handles.slider_blue, 'Value', 0);
        
        % Update handles
        guidata(hObject, handles);
    else
        % Jika 'original_im' belum ada, beri notifikasi
        msgbox('Original image not loaded. Please load an image first.');
    end
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function w_Callback(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w as text
%        str2double(get(hObject,'String')) returns contents of w as a double


% --- Executes during object creation, after setting all properties.
function w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as a double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

    % Get height and width values from input fields
    height = str2double(get(handles.h, 'string'));
    weight = str2double(get(handles.w, 'string'));
    
    % Check if height and weight values are valid
    if isnan(height) || isnan(weight) || height <= 0 || weight <= 0
        msgbox('Please enter valid height and weight values.', 'Error', 'error');
        return;
    end
    
    % Resize the image
    resizedImage = imresize(handles.im, [weight height]);
    
    % Display the resized image
    axes(handles.imageProcessed);
    imshow(resizedImage);
    
    % Update the processed image in handles
    handles.im = resizedImage;
    guidata(hObject, handles);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function w_ori_Callback(hObject, eventdata, handles)
% hObject    handle to w_ori (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_ori as text
%        str2double(get(hObject,'String')) returns contents of w_ori as a double


% --- Executes during object creation, after setting all properties.
function w_ori_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_ori (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_ori_Callback(hObject, eventdata, handles)
% hObject    handle to h_ori (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h_ori as text
%        str2double(get(hObject,'String')) returns contents of h_ori as a double


% --- Executes during object creation, after setting all properties.
function h_ori_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h_ori (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_red_Callback(hObject, eventdata, handles)
red_value = get(handles.slider_red, 'Value');
    updateImageColor(handles, red_value, 'red');
% hObject    handle to slider_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_green_Callback(hObject, eventdata, handles)
green_value = get(handles.slider_green, 'Value');
    updateImageColor(handles, green_value, 'green');
% hObject    handle to slider_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_blue_Callback(hObject, eventdata, handles)
blue_value = get(handles.slider_blue, 'Value');
    updateImageColor(handles, blue_value, 'blue');
% hObject    handle to slider_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function updateImageColor(handles, color_value, color_channel)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

    % Ambil gambar asli dari handles.original_im
    im = handles.original_im;

    % Pisahkan channel RGB
    red_channel = im(:,:,1);
    green_channel = im(:,:,2);
    blue_channel = im(:,:,3);

    % Sesuaikan channel berdasarkan slider yang diubah
    switch color_channel
        case 'red'
            red_channel = red_channel * color_value;
        case 'green'
            green_channel = green_channel * color_value;
        case 'blue'
            blue_channel = blue_channel * color_value;
    end

    % Gabungkan kembali channel menjadi gambar dengan tema warna baru
    modified_image = cat(3, red_channel, green_channel, blue_channel);

    % Tampilkan gambar yang sudah diubah di axes
    axes(handles.imageProcessed);
    imshow(modified_image);

    % Update handles.im dengan gambar yang baru
    handles.im = modified_image;
    guidata(handles.figure1, handles);


% --- Executes on slider movement.
function adj_clarity_Callback(hObject, eventdata, handles)
clarity_value = get(hObject, 'Value');
    updateImageAdjustments(handles, clarity_value, 'clarity');
% hObject    handle to adj_clarity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_clarity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_clarity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_contrast_Callback(hObject, eventdata, handles)
contrast_value = get(hObject, 'Value');
    updateImageAdjustments(handles, contrast_value, 'contrast');
% hObject    handle to adj_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_brightness_Callback(hObject, eventdata, handles)
brightness_value = get(handles.adj_brightness, 'Value');
    updateImageAdjustments(handles, brightness_value, 'brightness');
% hObject    handle to adj_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_saturation_Callback(hObject, eventdata, handles)
saturation_value = get(hObject, 'Value');
    updateImageAdjustments(handles, saturation_value, 'saturation');
% hObject    handle to adj_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_saturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_hue_Callback(hObject, eventdata, handles)
hue_value = get(hObject, 'Value');
    updateImageAdjustments(handles, hue_value, 'hue');
% hObject    handle to adj_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_hue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_shadows_Callback(hObject, eventdata, handles)
shadows_value = get(hObject, 'Value');
    updateImageAdjustments(handles, shadows_value, 'shadows');
% hObject    handle to adj_shadows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_shadows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_shadows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_highlights_Callback(hObject, eventdata, handles)
highlights_value = get(hObject, 'Value');
    updateImageAdjustments(handles, highlights_value, 'highlights');
% hObject    handle to adj_highlights (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_highlights_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_highlights (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function adj_temperature_Callback(hObject, eventdata, handles)
temperature_value = get(hObject, 'Value');
    updateImageAdjustments(handles, temperature_value, 'temperature');
% hObject    handle to adj_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function adj_temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adj_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function updateImageAdjustments(handles, adjustment_value, adjustment_type)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end
% Check if the original image is loaded
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        im = handles.original_im;  % Get the original image from handles
        
        % Convert image to double precision [0, 1] for consistent calculations
        im = double(im) / 255;

        % Process image adjustments based on the type
        switch adjustment_type
            case 'brightness'
                % Adjust brightness by adding the adjustment value
                adjusted_image = im + adjustment_value;  % Simple addition for brightness

            case 'contrast'
                % Adjust contrast by scaling image intensity
                factor = 1 + adjustment_value;  % Define the contrast factor
                adjusted_image = 0.5 + factor * (im - 0.5);  % Contrast around midpoint 0.5

            case 'clarity'
                % Simulate clarity adjustment with simple edge enhancement using a sharpening kernel
                kernel = [0 -1 0; -1 5 -1; 0 -1 0];  % Simple 3x3 sharpening kernel
                adjusted_image = im;
                % Apply kernel to each channel individually
                for channel = 1:3
                    adjusted_image(:, :, channel) = applyKernel(im(:, :, channel), kernel);
                end

            case 'saturation'
                % Manually convert RGB to grayscale, then adjust saturation by interpolation
                grayscale = 0.2989 * im(:, :, 1) + 0.5870 * im(:, :, 2) + 0.1140 * im(:, :, 3);
                adjusted_image = im + adjustment_value * (im - cat(3, grayscale, grayscale, grayscale));

            case 'hue'
                % Approximate hue adjustment by rotating color channels
                if adjustment_value > 0
                    adjusted_image = cat(3, im(:, :, 2), im(:, :, 3), im(:, :, 1));
                else
                    adjusted_image = cat(3, im(:, :, 3), im(:, :, 1), im(:, :, 2));
                end

            case 'shadows'
                % Increase brightness in dark regions
                shadows_mask = im < 0.5;
                adjusted_image = im + shadows_mask .* adjustment_value;

            case 'highlights'
                % Decrease brightness in bright regions
                highlights_mask = im >= 0.5;
                adjusted_image = im - highlights_mask .* adjustment_value;

            case 'temperature'
                % Adjust temperature by adding a warm or cool tint
                warm_filter = cat(3, 1.1, 1.0, 0.9);  % Warm (red/yellow tint)
                cool_filter = cat(3, 0.9, 1.0, 1.1);  % Cool (blue tint)
                if adjustment_value > 0
                    adjusted_image = im .* (1 + adjustment_value * (warm_filter - 1));
                else
                    adjusted_image = im .* (1 + abs(adjustment_value) * (cool_filter - 1));
                end

            otherwise
                error('Unsupported adjustment type. Use ''brightness'', ''contrast'', ''clarity'', ''saturation'', ''hue'', ''shadows'', ''highlights'', or ''temperature''.');
        end

        % Clip values to [0, 1] and scale to uint8 for display
        adjusted_image = uint8(min(max(adjusted_image, 0), 1) * 255);

        % Display the adjusted image
        axes(handles.imageProcessed);
        imshow(adjusted_image);

        % Update handles with the adjusted image
        handles.im = adjusted_image;
        guidata(handles.figure1, handles);  % Save updated handles structure
    else
        % Display a message if the original image isn't loaded
        msgbox('Original image not loaded. Please load an image first.', 'Error', 'error');
    end

function output = applyKernel(input_image, kernel)
    % Apply a 3x3 kernel filter to the image manually (no toolbox function)
    [rows, cols] = size(input_image);
    
    % Manually pad the image by adding a border of NaN (or zero if preferred)
    pad_image = zeros(rows + 2, cols + 2);
    pad_image(2:end-1, 2:end-1) = input_image;  % Copy original image into padded array
    
    output = zeros(rows, cols);  % Initialize output image

    % Convolve the image with the kernel (no toolbox function)
    for r = 1:rows
        for c = 1:cols
            sub_matrix = pad_image(r:r+2, c:c+2);  % Get 3x3 region of the image
            output(r, c) = sum(sum(sub_matrix .* kernel));  % Apply kernel and sum
        end
    end 
    


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in removebg.
function removebg_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles);  % Save updated handles
end

   % Check if the original image is loaded
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        im = handles.original_im;  % Get the original image from handles
        
        % Convert image to double precision [0, 1] for processing
        im = double(im) / 255;
        
        % Convert to grayscale to simplify background detection
        gray_im = 0.2989 * im(:, :, 1) + 0.5870 * im(:, :, 2) + 0.1140 * im(:, :, 3);
        
        % Calculate the average intensity of the image
        avg_intensity = mean(gray_im(:));
        
        % If the average intensity is low, assume dark background (black)
        % If the average intensity is high, assume bright background (white)
        if avg_intensity > 0.5
            % Bright background (e.g., white) - use high threshold
            threshold = 0.8;  
            bg_mask = gray_im > threshold;  % Mask for bright background
        else
            % Dark background (e.g., black) - use low threshold
            threshold = 0.2;  
            bg_mask = gray_im < threshold;  % Mask for dark background
        end
        
        % Create an alpha channel (1 for object, 0 for background)
        alpha_channel = ones(size(im, 1), size(im, 2));  % Default to fully opaque
        alpha_channel(bg_mask) = 0;  % Set background pixels to fully transparent
        
        % Apply the mask to each color channel
        adjusted_image = im;  % Start with the original image
        for channel = 1:3
            im_channel = adjusted_image(:, :, channel);
            im_channel(bg_mask) = 0;  % Set the background pixels to 0 (transparent in display)
            adjusted_image(:, :, channel) = im_channel;
        end
        
        % Set the background to green in the display image
        adjusted_image(:, :, 1) = adjusted_image(:, :, 1) + bg_mask * 0;  % Red channel (keep it 0)
        adjusted_image(:, :, 2) = adjusted_image(:, :, 2) + bg_mask * 1;  % Green channel (set to 1)
        adjusted_image(:, :, 3) = adjusted_image(:, :, 3) + bg_mask * 0;  % Blue channel (keep it 0)

        % Create the RGBA image (RGB + Alpha channel)
        adjusted_image_with_alpha = cat(3, adjusted_image, alpha_channel);
        
        % Convert the image to uint8 (0-255 range) for saving as PNG
        adjusted_image_with_alpha = uint8(adjusted_image_with_alpha * 255);

        % Display the adjusted image with a green background
        axes(handles.imageProcessed);
        imshow(adjusted_image);

        % Update handles with the adjusted image
        handles.im = adjusted_image;
        guidata(handles.figure1, handles);  % Save updated handles structure

        % Save the image with transparency (use alpha channel)
        [fileName, filePath] = uiputfile('*.png', 'Save Image As');
        if fileName
            % Create the image in a format imwrite can handle
            rgb_image = adjusted_image;  % RGB image for display (with green background)
            alpha_image = alpha_channel;  % Alpha channel for transparency
            
            % Save as PNG with transparency
            imwrite(rgb_image, fullfile(filePath, fileName), 'png', 'Alpha', alpha_image);
        end
    else
        % Display a message if the original image isn't loaded
        msgbox('Original image not loaded. Please load an image first.', 'Error', 'error');
    end
% hObject    handle to removebg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in undo.
function undo_Callback(hObject, eventdata, handles)
if ~isempty(handles.undoStack)
        % Pop the last image from the undo stack
        previousImage = handles.undoStack{end};
        handles.undoStack(end) = [];  % Remove it from the undo stack
        
        % Push the current image to the redo stack before making the change
        handles.redoStack{end+1} = handles.im;  % Store the image in redo stack
        
        % Update the displayed image to the previous state
        handles.im = previousImage;
        axes(handles.imageProcessed);
        imshow(handles.im);
        
        % Update the GUI state
        guidata(handles.figure1, handles);  % Save updated handles
    else
        msgbox('No more actions to undo', 'Undo Error', 'error');
    end
% hObject    handle to undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in redo.
function redo_Callback(hObject, eventdata, handles)
if ~isempty(handles.redoStack)
        % Pop the last image from the redo stack
        nextImage = handles.redoStack{end};
        handles.redoStack(end) = [];  % Remove it from the redo stack
        
        % Push the current image to the undo stack before making the change
        handles.undoStack{end+1} = handles.im;  % Store the image in undo stack
        
        % Update the displayed image to the next state
        handles.im = nextImage;
        axes(handles.imageProcessed);
        imshow(handles.im);
        
        % Update the GUI state
        guidata(handles.figure1, handles);  % Save updated handles
    else
        msgbox('No more actions to redo', 'Redo Error', 'error');
    end
% hObject    handle to redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function saveState(handles)
    % Save the current image state in the undo stack before making any changes
    if isfield(handles, 'im')
        handles.undoStack{end+1} = handles.im;  % Store the current image
        guidata(handles.figure1, handles);  % Save updated handles
    end
