module QuestionsHelper
  def question_header(test)
    if action_name == 'new'
      "Create New #{test.title} question"
    elsif action_name == 'edit'
      "Edit #{test.title} question"
    end
  end
end
