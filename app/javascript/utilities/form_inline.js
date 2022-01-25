document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)
  
  let errors = $('.resource-errors')

  if (errors.dataset) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let $link = $('.form-inline-link[data-test-id="' + testId + '"]')
  let $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  let $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    $link.text('Cancel')
  } else {
    $link.text('Edit')
  }
}
