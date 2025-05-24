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

% Last Modified by GUIDE v2.5 14-Nov-2024 23:13:45

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

% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles); 
end

if size(handles.im, 3) == 3
    G = rgb2gray(handles.im); 
else
    G = handles.im; 
end

axes(handles.imageProcessed); 
imshow(G);  

handles.im = G;

show_hist_Callback(hObject, eventdata, handles); 

guidata(hObject, handles);
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

% --- Executes on button press in bw.
function bw_Callback(hObject, eventdata, handles)
if isfield(handles, 'im')
    % Only save the state if it's a valid image
    handles.undoStack{end+1} = handles.im;  
    guidata(handles.figure1, handles); 
end

bwImage = imbinarize(rgb2gray(handles.im));  

axes(handles.imageProcessed);
imshow(bwImage);
show_hist_Callback(hObject, eventdata, handles); 
handles.im = bwImage;
guidata(hObject, handles);

function negative_Callback(hObject, eventdata, handles)
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

% --- Executes on button press in smoothing.
function smoothing_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = smoothedImage;
guidata(hObject, handles);

% --- Executes on button press in rotation.
function rotation_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = rotatedImage;
guidata(hObject, handles);

% --- Executes on button press in sharpening.
function sharpening_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = sharpenedImage;
guidata(hObject, handles);

% --- Executes on button press in blur.
function blur_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = blurredImage;
guidata(hObject, handles);

% --- Executes on button press in edge_detect.
function edge_detect_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = edgeImage;
guidata(hObject, handles);

% --- Executes on button press in hist_equal.
function hist_equal_Callback(hObject, eventdata, handles)
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

% Update gambar terproses di handles.im SEBELUM memanggil show_hist_Callback
handles.im = imEq;

% Tampilkan gambar yang sudah di-equalized di axes
axes(handles.imageProcessed);  % Akses area untuk gambar terproses
imshow(imEq);  % Tampilkan gambar hasil equalization

% Panggil fungsi untuk memperbarui histogram
show_hist_Callback(hObject, eventdata, handles);

% Simpan handles terbaru
guidata(hObject, handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in vertical.
function vertical_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = flippedImage;
guidata(hObject, handles);

% --- Executes on button press in pick_image.
function pick_image_Callback(hObject, eventdata, handles)
    [FileName, PathName] = uigetfile({'*.jpg;*.jpeg;*.png;*.webp;*.tif;*.bmp', 'Pilih Citra (JPG, JPEG, PNG, WEBP, TIF, BMP)'});
    if FileName ~= 0  % Memeriksa apakah file dipilih
        % Baca gambar dengan dukungan untuk WEBP
        [~, ~, ext] = fileparts(FileName);  % Mendapatkan ekstensi file
        if strcmpi(ext, '.webp')
            im = imread([PathName, FileName], 'webp');  % Membaca file WEBP
        else
            im = imread([PathName, FileName]);  % Membaca format lain
        end

        % Set gambar yang dimuat sebagai gambar saat ini
        handles.im = im;  
        handles.original_im = im;  % Menyimpan gambar asli di handles

        % Mendapatkan dimensi gambar asli
        [height, width, ~] = size(im);

        % Menampilkan dimensi gambar asli di kolom w_ori dan h_ori
        set(handles.w_ori, 'String', num2str(width));  % Set lebar di w_ori
        set(handles.h_ori, 'String', num2str(height)); % Set tinggi di h_ori

        % Memperbarui struktur handles
        guidata(hObject, handles);

        % Menampilkan gambar asli di axes gambarRaw
        axes(handles.imageRaw);
        imshow(im);

        % Opsional: Menghapus area gambar yang telah diproses
        cla(handles.imageProcessed);  % Menghapus area gambar yang diproses sebelumnya

        % Menampilkan histogram gambar asli
        show_hist_Callback(hObject, eventdata, handles);  % Memanggil fungsi untuk menampilkan histogram gambar
    end
    % eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in horizontal.
function horizontal_Callback(hObject, eventdata, handles)
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
show_hist_Callback(hObject, eventdata, handles);  % Call the histogram update function
% Update the processed image in handles
handles.im = flippedImage;
guidata(hObject, handles);

% --- Executes on button press in save_image.
function save_image_Callback(hObject, eventdata, handles)
    thresh = handles.im;
    [name_file_save, path_save] = uiputfile({ ...
        '*.bmp', 'File Bitmap (*.bmp)'; ...
        '*.jpg', 'File JPG (*.jpg)'; ...
        '*.jpeg', 'File JPEG (*.jpeg)'; ...
        '*.png', 'File PNG (*.png)'; ...
        '*.tif', 'File TIF (*.tif)'; ...
        '*.webp', 'File WEBP (*.webp)'; ...
        '*.*', 'All Files (*.*)'}, ...
        'Save Image');

    if ~isequal(name_file_save, 0)
        % Menyimpan file dalam format WEBP jika dipilih
        [~, ~, ext] = fileparts(name_file_save);
        if strcmpi(ext, '.webp')
            imwrite(thresh, fullfile(path_save, name_file_save), 'webp');
        else
            imwrite(thresh, fullfile(path_save, name_file_save));  % Save other formats
        end
    else
        return
    end
% hObject    handle to save_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function proses_Callback(hObject, eventdata, handles)
set(handles.panelProses, 'visible', 'on');
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% Cek apakah field 'original_im' ada dan sudah di-set
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        % Reset gambar ke gambar asli dan tampilkan di imageProcessed
        handles.im = handles.original_im;  % Kembalikan gambar asli ke handles.im
        axes(handles.imageProcessed);
        imshow(handles.im);  % Tampilkan gambar asli di axes untuk processed image
        
        % Kosongkan axes untuk processed image jika perlu
        %cla(handles.imageProcessed);  % Kosongkan gambar yang sudah diproses jika perlu
        cla(handles.histogram_asli);
        cla(handles.histogram_edit);
        
        % Menyembunyikan angka pada sumbu dan garis grid, hanya menyisakan kotak axes
        set(handles.histogram_asli, 'XTick', [], 'YTick', []);  % Sembunyikan angka sumbu di histogram asli
        set(handles.histogram_asli, 'XColor', 'k', 'YColor', 'k');  % Warna kotak tetap hitam
        box(handles.histogram_asli, 'on');  % Pastikan kotak tetap terlihat

        set(handles.histogram_edit, 'XTick', [], 'YTick', []);  % Sembunyikan angka sumbu di histogram edit
        set(handles.histogram_edit, 'XColor', 'k', 'YColor', 'k');  % Warna kotak tetap hitam
        box(handles.histogram_edit, 'on');  % Pastikan kotak tetap terlihat
        
        set(handles.w, 'String', '');
        set(handles.h, 'String', '');
        set(handles.adj_brightness, 'Value', 0);
        set(handles.adj_contrast, 'Value', 0);
        set(handles.adj_clarity, 'Value', 0);
        set(handles.adj_saturation, 'Value', 0);
        set(handles.adj_hue, 'Value', 0);
        set(handles.adj_shadows, 'Value', 0);
        set(handles.adj_highlights, 'Value', 0);
        set(handles.adj_temperature, 'Value', 0);
        set(handles.slidered, 'Value', 0);
        set(handles.slidegreen, 'Value', 0);
        set(handles.slideblue, 'Value', 0);
        
        % Update handles
        guidata(hObject, handles);
        
        % Menampilkan histogram untuk gambar asli (memanggil fungsi show_hist untuk gambar asli)
        show_hist_Callback(hObject, eventdata, handles);
    else
        % Jika 'original_im' belum ada, beri notifikasi
        msgbox('Original image not loaded. Please load an image first.');
    end
% hObject    handle to reset (see GCBO)
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


% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
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
% hObject    handle to resize (see GCBO)
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
function adj_brightness_Callback(hObject, eventdata, handles)
    brightness_value = get(hObject, 'Value');
    if brightness_value == 0
        imshow(handles.originalImage, 'Parent', handles.imageAxes); % Display the original image
    else
        updateImageAdjustments(handles, brightness_value, 'brightness');
    end

% --- Executes during object creation, after setting all properties.
function adj_brightness_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);

% --- Executes on slider movement.
function adj_clarity_Callback(hObject, eventdata, handles)
    clarity_value = get(hObject, 'Value');
    updateImageAdjustments(handles, clarity_value, 'clarity');
    

% --- Executes during object creation, after setting all properties.
function adj_clarity_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);


% --- Executes on slider movement.
function adj_contrast_Callback(hObject, eventdata, handles)
    contrast_value = get(hObject, 'Value');
    updateImageAdjustments(handles, contrast_value, 'contrast');


% --- Executes during object creation, after setting all properties.
function adj_contrast_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);

% --- Executes on slider movement.
function adj_saturation_Callback(hObject, eventdata, handles)
    saturation_value = get(hObject, 'Value');
    updateImageAdjustments(handles, saturation_value, 'saturation');


% --- Executes during object creation, after setting all properties.
function adj_saturation_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);

% --- Executes on slider movement.
function adj_hue_Callback(hObject, eventdata, handles)
    hue_value = get(hObject, 'Value');
    updateImageAdjustments(handles, hue_value, 'hue');


% --- Executes during object creation, after setting all properties.
function adj_hue_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);
    
% --- Executes on slider movement.
function adj_shadows_Callback(hObject, eventdata, handles)
    shadows_value = get(hObject, 'Value');
    updateImageAdjustments(handles, shadows_value, 'shadows');


% --- Executes during object creation, after setting all properties.
function adj_shadows_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);

% --- Executes on slider movement.
function adj_highlights_Callback(hObject, eventdata, handles)
    highlights_value = get(hObject, 'Value');
    updateImageAdjustments(handles, highlights_value, 'highlights');


% --- Executes during object creation, after setting all properties.
function adj_highlights_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);


% --- Executes on slider movement.
function adj_temperature_Callback(hObject, eventdata, handles)
    temperature_value = get(hObject, 'Value');
    updateImageAdjustments(handles, temperature_value, 'temperature');


% --- Executes during object creation, after setting all properties.
function adj_temperature_CreateFcn(hObject, eventdata, handles)
    if isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', [0.9 0.9 0.9]);
    end
    set(hObject, 'Min', -1);
    set(hObject, 'Max', 1);
    set(hObject, 'Value', 0);

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% Konfirmasi untuk menutup aplikasi
    choice = questdlg('Apakah Anda yakin ingin keluar?', ...
                      'Konfirmasi Keluar', 'Yes', 'No', 'No');
    % Jika pengguna memilih 'Yes', tutup jendela GUI
    if strcmp(choice, 'Yes')
        close(handles.figure1);  % Tutup figure utama GUI
    end
% hObject    handle to exit (see GCBO)
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






% --- Executes on slider movement.
function slidered_Callback(hObject, eventdata, handles)
red_value = get(hObject, 'Value');
    updateImageAdjustments(handles, red_value, 'red');
% hObject    handle to slidered (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slidered_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slidered (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slidegreen_Callback(hObject, eventdata, handles)
green_value = get(hObject, 'Value');
    updateImageAdjustments(handles, green_value, 'green');
% hObject    handle to slidegreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slidegreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slidegreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slideblue_Callback(hObject, eventdata, handles)
blue_value = get(hObject, 'Value');
    updateImageAdjustments(handles, blue_value, 'blue');
% hObject    handle to slideblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slideblue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slideblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function updateImageAdjustments(handles, adjustment_value, adjustment_type)
    % Check if the original image is available
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        % Initialize adjusted_image as the original image
        adjusted_image = double(handles.original_im) / 255;

        % Apply adjustment based on type
        switch adjustment_type
            case 'brightness'
                adjusted_image = adjusted_image + adjustment_value;

            case 'contrast'
                factor = 1 + adjustment_value;
                adjusted_image = 0.5 + factor * (adjusted_image - 0.5);

            case 'clarity'
                if adjustment_value ~= 0
                    kernel = [0 -1 0; -1 5 -1; 0 -1 0];  % Sharpening filter
                    for channel = 1:3
                        adjusted_image(:, :, channel) = applyKernel(adjusted_image(:, :, channel), kernel);
                    end
                end

            case 'saturation'
                grayscale = 0.2989 * adjusted_image(:, :, 1) + 0.5870 * adjusted_image(:, :, 2) + 0.1140 * adjusted_image(:, :, 3);
                adjusted_image = adjusted_image + adjustment_value * (adjusted_image - cat(3, grayscale, grayscale, grayscale));

            case 'hue'
                if adjustment_value ~= 0
                    hsvImage = rgb2hsv(adjusted_image);
                    hsvImage(:, :, 1) = mod(hsvImage(:, :, 1) + adjustment_value, 1);
                    adjusted_image = hsv2rgb(hsvImage);
                end

            case 'shadows'
                shadows_mask = adjusted_image < 0.5;
                adjusted_image = adjusted_image - shadows_mask .* adjustment_value;

            case 'highlights'
                highlights_mask = adjusted_image >= 0.5;
                adjusted_image = adjusted_image + highlights_mask .* adjustment_value;

            case 'temperature'
                warm_filter = cat(3, 1.1, 1.0, 0.9);
                cool_filter = cat(3, 0.9, 1.0, 1.1);
                if adjustment_value > 0
                    adjusted_image = adjusted_image .* (1 + adjustment_value * (warm_filter - 1));
                else
                    adjusted_image = adjusted_image .* (1 + abs(adjustment_value) * (cool_filter - 1));
                end

            case 'grayscale'
                % Convert to grayscale
                if size(adjusted_image, 3) == 3
                    adjusted_image = rgb2gray(adjusted_image);  % Convert RGB to grayscale
                end

            case 'bw'
                adjusted_image = imbinarize(rgb2gray(adjusted_image));

            case 'smoothing'
                adjusted_image = imgaussfilt(adjusted_image, 2);

            case 'rotation'
                adjusted_image = imrotate(adjusted_image, 90);

            case 'sharpening'
                adjusted_image = imsharpen(adjusted_image);

            case 'blur'
                adjusted_image = imgaussfilt(adjusted_image, 5);

            case 'edge_detect'
                adjusted_image = edge(rgb2gray(adjusted_image), 'Sobel');

            case 'hist_equal'
                imGray = rgb2gray(adjusted_image);
                adjusted_image = histeq(imGray);
                case 'red'
                adjusted_image(:, :, 1) = adjusted_image(:, :, 1) + adjustment_value;
            case 'green'
                adjusted_image(:, :, 2) = adjusted_image(:, :, 2) + adjustment_value;
            case 'blue'
                adjusted_image(:, :, 3) = adjusted_image(:, :, 3) + adjustment_value;
        end

        % Clip values to [0, 1] and scale to uint8 for display
        adjusted_image = uint8(min(max(adjusted_image, 0), 1) * 255);

        % Display the adjusted image
        axes(handles.imageProcessed);
        imshow(adjusted_image);

        % Save adjusted image in handles
        handles.adjusted_im = adjusted_image;
        handles.im = adjusted_image;  % Update for histogram
        guidata(handles.figure1, handles);  % Save updated handles

        % Update histogram for the processed image
        show_hist_Callback(handles.figure1, [], handles);
    else
        msgbox('Original image not loaded. Please load an image first.', 'Error', 'error');
    end
    
    
function output = applyKernel(input_image, kernel)
    % Terapkan kernel 3x3 secara manual (tanpa toolbox)
    [rows, cols] = size(input_image);
    
    % Membuat citra dengan padding manual
    pad_image = zeros(rows + 2, cols + 2);
    pad_image(2:end-1, 2:end-1) = input_image;  % Tempatkan citra asli di tengah
    
    % Isi padding dengan mereplikasi tepi
    pad_image(1, 2:end-1) = input_image(1, :);  % Baris atas
    pad_image(end, 2:end-1) = input_image(end, :);  % Baris bawah
    pad_image(2:end-1, 1) = input_image(:, 1);  % Kolom kiri
    pad_image(2:end-1, end) = input_image(:, end);  % Kolom kanan
    pad_image(1, 1) = input_image(1, 1);  % Pojok kiri atas
    pad_image(1, end) = input_image(1, end);  % Pojok kanan atas
    pad_image(end, 1) = input_image(end, 1);  % Pojok kiri bawah
    pad_image(end, end) = input_image(end, end);  % Pojok kanan bawah
    
    output = zeros(rows, cols);  % Inisialisasi citra keluaran

    % Konvolusi dengan kernel
    for r = 1:rows
        for c = 1:cols
            sub_matrix = pad_image(r:r+2, c:c+2);  % Ambil wilayah 3x3
            output(r, c) = sum(sum(sub_matrix .* kernel));  % Terapkan kernel dan jumlahkan
        end
    end
    
    % Pemangkasan hasil konvolusi agar tetap dalam rentang [0, 1]
    output = min(max(output, 0), 1);
    
    
function removebg_Callback(hObject, eventdata, handles)
    if isfield(handles, 'im')
        % Hanya simpan keadaan jika itu gambar yang valid
        handles.undoStack{end+1} = handles.im;  
        guidata(handles.figure1, handles);  % Simpan handles yang diperbarui
    end

    % Periksa apakah gambar asli atau yang sudah difilter ada
    if isfield(handles, 'adjusted_im') && ~isempty(handles.adjusted_im)
        im = handles.adjusted_im;  % Gunakan gambar yang sudah difilter
    elseif isfield(handles, 'original_im') && ~isempty(handles.original_im)
        im = handles.original_im;  % Jika tidak ada gambar yang difilter, gunakan gambar asli
    else
        msgbox('Gambar belum dimuat.', 'Error', 'error');
        return;
    end

    % Ubah gambar menjadi presisi ganda [0, 1] untuk pengolahan
    im_double = double(im) / 255;

    % Ubah gambar menjadi grayscale untuk mendeteksi latar belakang
    gray_im = 0.2989 * im_double(:, :, 1) + 0.5870 * im_double(:, :, 2) + 0.1140 * im_double(:, :, 3);

    % Hitung intensitas rata-rata gambar untuk menentukan latar belakang
    avg_intensity = mean(gray_im(:));

    % Tentukan threshold untuk latar belakang terang atau gelap
    if avg_intensity > 0.5
        threshold = 0.8;  % Latar belakang terang
        bg_mask = gray_im > threshold;  % Masker untuk latar belakang terang
    else
        threshold = 0.2;  % Latar belakang gelap
        bg_mask = gray_im < threshold;  % Masker untuk latar belakang gelap
    end

    % Buat saluran alpha untuk transparansi
    alpha_channel = ones(size(im, 1), size(im, 2));  % Default transparan penuh
    alpha_channel(bg_mask) = 0;  % Set piksel latar belakang menjadi transparan

    % Terapkan masker ke gambar RGB, set piksel latar belakang menjadi transparan
    im_double(bg_mask) = 0;  % Set piksel latar belakang menjadi 0 (untuk transparansi)

    % Konversi kembali gambar menjadi uint8
    im_rgb = uint8(im_double * 255);  % Ubah gambar menjadi uint8 untuk disimpan

    % Tampilkan gambar dengan latar belakang transparan
    axes(handles.imageProcessed);
    imshow(im_rgb);  % Gambar dengan latar belakang transparan

    % Simpan gambar yang disesuaikan dengan latar belakang transparan
    handles.adjusted_im = im_rgb;  % Simpan gambar yang telah diubah
    guidata(handles.figure1, handles);  % Simpan struktur handles yang diperbarui

    % Tanyakan lokasi dan nama file untuk menyimpan gambar
    [fileName, filePath] = uiputfile('*.png', 'Save Image As');
    if fileName
        % Simpan gambar dengan transparansi (alpha channel)
        imwrite(im_rgb, fullfile(filePath, fileName), 'png', 'Alpha', alpha_channel);
    end

    
    % --- Executes on button press in show_hist.
function show_hist_Callback(hObject, eventdata, handles)
    % Display histogram for the original image if available
    if isfield(handles, 'original_im') && ~isempty(handles.original_im)
        img_rgb_original = handles.original_im;
        
        % If grayscale, convert to RGB
        if size(img_rgb_original, 3) == 1
            img_rgb_original = cat(3, img_rgb_original, img_rgb_original, img_rgb_original);
        end
        
        % Calculate histogram for each RGB channel
        hist_r_original = calculate_histogram(img_rgb_original(:, :, 1));
        hist_g_original = calculate_histogram(img_rgb_original(:, :, 2));
        hist_b_original = calculate_histogram(img_rgb_original(:, :, 3));
        
        % Display the histogram for the original image
        axes(handles.histogram_asli);  % Ensure correct axes are targeted
        cla;  % Clear previous plots
        hold on;
        bar(hist_r_original, 'FaceColor', 'r', 'BarWidth', 1);
        bar(hist_g_original, 'FaceColor', 'g', 'BarWidth', 1);
        bar(hist_b_original, 'FaceColor', 'b', 'BarWidth', 1);
        hold off;
        xticks([]);
        yticks([]);
        ylim([0, max([hist_r_original, hist_g_original, hist_b_original]) * 1.1]);
    end

    if isfield(handles, 'im') && ~isempty(handles.im)
        img_rgb_processed = handles.im;

        % If grayscale, convert to RGB
        if size(img_rgb_processed, 3) == 1
            img_rgb_processed = cat(3, img_rgb_processed, img_rgb_processed, img_rgb_processed);
        end

        % Calculate histogram for each RGB channel
        hist_r_processed = calculate_histogram(img_rgb_processed(:, :, 1));
        hist_g_processed = calculate_histogram(img_rgb_processed(:, :, 2));
        hist_b_processed = calculate_histogram(img_rgb_processed(:, :, 3));

        % Display the histogram for the processed image
        axes(handles.histogram_edit);  % Ensure correct axes are targeted
        cla;  % Clear previous plots
        hold on;
        bar(hist_r_processed, 'FaceColor', 'r', 'BarWidth', 1);
        bar(hist_g_processed, 'FaceColor', 'g', 'BarWidth', 1);
        bar(hist_b_processed, 'FaceColor', 'b', 'BarWidth', 1);
        hold off;
        xticks([]);
        yticks([]);
        ylim([0, max([hist_r_processed, hist_g_processed, hist_b_processed]) * 1.1]);
    end

    % Save updated handles
    guidata(hObject, handles);
    
% Fungsi untuk menghitung histogram manual
function hist = calculate_histogram(img)
    img = double(img);
    hist = zeros(1, 256);
    for i = 1:numel(img)
        pixel_value = round(img(i));
        if pixel_value >= 0 && pixel_value <= 255
            hist(pixel_value + 1) = hist(pixel_value + 1) + 1;
        end
    end
