# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                       { username: 'tester1', password: 'tester1' },
                       { username: 'tester2', password: 'tester2' },
                       { username: 'tester3', password: 'tester3' }
                     ])
categories = Category.create!([
                                { title: 'Maths' },
                                { title: 'IT' }
                              ])
tests = Test.create!([
                       { title: 'Algebra', level: 0, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Algebra', level: 1, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Geometry', level: 0, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Geometry', level: 1, category_id: categories[0].id, user_id: users[0].id },
                       { title: 'Ruby', level: 0, category_id: categories[1].id, user_id: users[1].id },
                       { title: 'Ruby', level: 1, category_id: categories[1].id, user_id: users[1].id },
                       { title: 'HTML', level: 0, category_id: categories[1].id, user_id: users[1].id },
                       { title: 'HTML', level: 1, category_id: categories[1].id, user_id: users[1].id }
                     ])
questions = Question.create!([
                               { body: '2+2', test_id: tests[0].id },
                               { body: '5+5', test_id: tests[0].id },
                               { body: '5*5', test_id: tests[1].id },
                               { body: '5*10', test_id: tests[1].id },
                               { body: 'Square area', test_id: tests[2].id },
                               { body: 'Rentagle area', test_id: tests[2].id },
                               { body: 'Pythagoream theorem', test_id: tests[3].id },
                               { body: 'a/sinA = b/sinB = c/sinC = 2R', test_id: tests[3].id },
                               { body: 'What does puts do', test_id: tests[4].id },
                               { body: 'What does gets do', test_id: tests[4].id },
                               { body: '1.class retuns ..', test_id: tests[5].id },
                               { body: '1.class.class retuns ..', test_id: tests[5].id },
                               { body: 'tag <h1> is ..', test_id: tests[6].id },
                               { body: 'tag <p> is ..', test_id: tests[6].id },
                               { body: 'What we write in attribute href', test_id: tests[7].id },
                               { body: 'tag <br> is', test_id: tests[7].id }
                             ])
Answer.create!([
                 { body: '4', correct: true, question_id: questions[0].id },
                 { body: '2', question_id: questions[0].id },
                 { body: '10', correct: true, question_id: questions[1].id },
                 { body: '0', question_id: questions[1].id },
                 { body: '25', correct: true, question_id: questions[2].id },
                 { body: '10', question_id: questions[2].id },
                 { body: '50', correct: true, question_id: questions[3].id },
                 { body: '15', question_id: questions[3].id },
                 { body: 'A = a*a', correct: true, question_id: questions[4].id },
                 { body: 'A = a+a', question_id: questions[4].id },
                 { body: 'A = a*b', correct: true, question_id: questions[5].id },
                 { body: 'A = a+a*2', question_id: questions[5].id },
                 { body: 'C^2=A^2+B^2', correct: true, question_id: questions[6].id },
                 { body: 'C=A^2+B^2', question_id: questions[6].id },
                 { body: 'Sinus theorem', correct: true, question_id: questions[7].id },
                 { body: 'Round theorem', question_id: questions[7].id },
                 { body: 'output in terminal', correct: true, question_id: questions[8].id },
                 { body: 'input in terminal', question_id: questions[8].id },
                 { body: 'input in terminal', correct: true, question_id: questions[9].id },
                 { body: 'output in terminal', question_id: questions[9].id },
                 { body: 'Fixnum', correct: true, question_id: questions[10].id },
                 { body: 'Integer', question_id: questions[10].id },
                 { body: 'Class', correct: true, question_id: questions[11].id },
                 { body: 'Fixnum', question_id: questions[11].id },
                 { body: 'Headline', correct: true, question_id: questions[12].id },
                 { body: 'Image', question_id: questions[12].id },
                 { body: 'Paragraph', correct: true, question_id: questions[13].id },
                 { body: 'Text', question_id: questions[13].id },
                 { body: 'link to site', correct: true, question_id: questions[14].id },
                 { body: 'image path', question_id: questions[14].id },
                 { body: 'break line', correct: true, question_id: questions[15].id },
                 { body: 'new line', question_id: questions[15].id }
               ])
Result.create!([
                 { user_id: users[0].id, test_id: tests[0].id, points: 5 },
                 { user_id: users[0].id, test_id: tests[2].id, points: 2 },
                 { user_id: users[0].id, test_id: tests[3].id, points: 1 },
                 { user_id: users[0].id, test_id: tests[4].id, points: 0 },
                 { user_id: users[1].id, test_id: tests[0].id, points: 6 },
                 { user_id: users[1].id, test_id: tests[6].id, points: 5 },
                 { user_id: users[1].id, test_id: tests[7].id, points: 4 },
                 { user_id: users[2].id, test_id: tests[0].id, points: 9 },
                 { user_id: users[2].id, test_id: tests[1].id, points: 7 },
                 { user_id: users[2].id, test_id: tests[2].id, points: 1 }
               ])
