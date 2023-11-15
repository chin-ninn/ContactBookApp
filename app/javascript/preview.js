document.addEventListener('DOMContentLoaded', function() {
  const postForm = document.getElementById('photo_form');
  const previewList = document.getElementById('previews');
  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="photo[images][]"]');
  fileField.addEventListener('change', function(e) {
    const files = e.target.files;
    if (!files || files.length === 0) return;

    // すでに存在するプレビューを削除
    const alreadyPreviews = document.querySelectorAll('.preview');
    alreadyPreviews.forEach(preview => preview.remove());

    // 全ての画像に対してプレビューを生成
    Array.from(files).forEach(file => {
      const blob = window.URL.createObjectURL(file);
      const previewWrapper = document.createElement('div');
      previewWrapper.setAttribute('class', 'preview');
      const previewImage = document.createElement('img');
      previewImage.setAttribute('class', 'preview-image');
      previewImage.setAttribute('src', blob);
      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);
    });
  });
});
