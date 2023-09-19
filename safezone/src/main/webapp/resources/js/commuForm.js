/**
 * 
 */
 
 function previewFiles() {
    var previewContainer = document.querySelector('#previewContainer');
    var fileInput = document.querySelector('input[type=file]');
    
    // 기존의 미리보기 내용을 지웁니다.
    previewContainer.innerHTML = '';

    var files = fileInput.files;
    
    if (files.length > 3) {
        alert('최대 3개의 파일만 업로드할 수 있습니다.');
        fileInput.value = ''; // 파일 선택 초기화
        return; // 업로드 중단
    }
    
    for (var i = 0; i < files.length; i++) {
        var file = files[i];

        var fileDiv = document.createElement('div');
        fileDiv.className = 'file-preview';

        var preview = document.createElement('img');
        preview.className = 'thumbnail';
        preview.style.maxWidth = '100px';
        

        if (file) {
            var reader = new FileReader();

            reader.onload = (function(file, fileDiv) {
                return function(e) {
                    var fileNameElement = document.createElement('p');
                    fileNameElement.innerText = file.name;

                    var previewClone = preview.cloneNode(true);
                    previewClone.src = e.target.result;
                    fileDiv.appendChild(previewClone);
                    fileDiv.appendChild(fileNameElement);
                    
			        var deleteButton = document.createElement('button');
			        deleteButton.className = 'btn btn-danger btn-sm';
			        deleteButton.innerText = '삭제';
                    
                    fileDiv.appendChild(deleteButton);
                };
            })(file, fileDiv);

            reader.readAsDataURL(file);
        }

        previewContainer.appendChild(fileDiv);
    }
}



function validateForm() {
    // 제목 유효성 검사
    var title = document.querySelector("[name='title']").value;
    if (title.length === 0 || title.length > 50) {
        alert("제목을 50자 이내로 입력하세요.");
        return false;
    }

    // 본문 유효성 검사
    var content = document.querySelector("[name='content']").value;
    if (content.length > 1000) {
        alert("본문을 1000자 이내로 입력하세요.");
        return false;
    }

    // 모든 필수 입력란에 값이 있는지 확인
    var location = document.querySelector("[name='location_num']").value;
    if (location === "지역") {
        alert("지역을 선택하세요.");
        return false;
    }
    
    var category = document.querySelector("[name='category']").value;
    if (category === "카테고리") {
        alert("카테고리를 선택하세요.");
        return false;
    }

    return true;
}



function countCharacters(inputId, countId, maxCount) {
    var input = document.querySelector('[name="' + inputId + '"]');
    var countSpan = document.getElementById(countId);
    var currentCount = input.value.length;

    // 최대 글자 수 설정
    if (maxCount && currentCount > maxCount) {
        input.value = input.value.substring(0, maxCount);
        currentCount = maxCount;
    }

    countSpan.innerText = currentCount;
}