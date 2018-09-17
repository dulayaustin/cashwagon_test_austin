$ ->
  $(document).ready customHooks
  $(document).on "page:load", customHooks

  $(document).on "click", ".question-answers-button", (e) ->
    e.preventDefault()
    question_id = $(this).data("question-id")
    answers_list = $(".question-answers[data-question-id=#{question_id}]")
    if answers_list.is(":visible")
      $(this).find("i.fa").toggleClass("fa-chevron-down").toggleClass("fa-chevron-up")
      answers_list.slideUp()
    else
      $(this).find("i.fa").toggleClass("fa-chevron-up").toggleClass("fa-chevron-down")
      answers_list.slideDown()


customHooks = ->
