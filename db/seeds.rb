# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                       { username: 'tester1', password: 'tester1', email: 'tester1@test.test' },
                       { username: 'tester2', password: 'tester2', email: 'tester2@test.test' },
                       { username: 'tester3', password: 'tester3', email: 'tester3@test.test' }
                     ])
categories = Category.create!([
                                { title: 'Maths' },
                                { title: 'IT' }
                              ])
tests = Test.create!([
                       { title: 'Algebra', level: 0, category: categories[0], author: users[0] },
                       { title: 'Algebra', level: 1, category: categories[0], author: users[0] },
                       { title: 'Geometry', level: 0, category: categories[0], author: users[0] },
                       { title: 'Geometry', level: 1, category: categories[0], author: users[0] },
                       { title: 'Ruby', level: 0, category: categories[1], author: users[1] },
                       { title: 'Ruby', level: 1, category: categories[1], author: users[1] },
                       { title: 'HTML', level: 0, category: categories[1], author: users[1] },
                       { title: 'HTML', level: 1, category: categories[1], author: users[1] }
                     ])
questions = Question.create!([
                               { body: '2+2', test: tests[0] },
                               { body: '5+5', test: tests[0] },
                               { body: '5*5', test: tests[1] },
                               { body: '5*10', test: tests[1] },
                               { body: 'Square area', test: tests[2] },
                               { body: 'Rentagle area', test: tests[2] },
                               { body: 'Pythagoream theorem', test: tests[3] },
                               { body: 'a/sinA = b/sinB = c/sinC = 2R', test: tests[3] },
                               { body: 'What does puts do', test: tests[4] },
                               { body: 'What does gets do', test: tests[4] },
                               { body: '1.class retuns ..', test: tests[5] },
                               { body: '1.class.class retuns ..', test: tests[5] },
                               { body: 'tag <h1> is ..', test: tests[6] },
                               { body: 'tag <p> is ..', test: tests[6] },
                               { body: 'What we write in attribute href', test: tests[7] },
                               { body: 'tag <br> is', test: tests[7] }
                             ])
Answer.create!([
                 { body: '4', correct: true, question: questions[0] },
                 { body: '2', question: questions[0] },
                 { body: '10', correct: true, question: questions[1] },
                 { body: '0', question: questions[1] },
                 { body: '25', correct: true, question: questions[2] },
                 { body: '10', question: questions[2] },
                 { body: '50', correct: true, question: questions[3] },
                 { body: '15', question: questions[3] },
                 { body: 'A = a*a', correct: true, question: questions[4] },
                 { body: 'A = a+a', question: questions[4] },
                 { body: 'A = a*b', correct: true, question: questions[5] },
                 { body: 'A = a+a*2', question: questions[5] },
                 { body: 'C^2=A^2+B^2', correct: true, question: questions[6] },
                 { body: 'C=A^2+B^2', question: questions[6] },
                 { body: 'Sinus theorem', correct: true, question: questions[7] },
                 { body: 'Round theorem', question: questions[7] },
                 { body: 'output in terminal', correct: true, question: questions[8] },
                 { body: 'input in terminal', question: questions[8] },
                 { body: 'input in terminal', correct: true, question: questions[9] },
                 { body: 'output in terminal', question: questions[9] },
                 { body: 'Fixnum', correct: true, question: questions[10] },
                 { body: 'Integer', question: questions[10] },
                 { body: 'Class', correct: true, question: questions[11] },
                 { body: 'Fixnum', question: questions[11] },
                 { body: 'Headline', correct: true, question: questions[12] },
                 { body: 'Image', question: questions[12] },
                 { body: 'Paragraph', correct: true, question: questions[13] },
                 { body: 'Text', question: questions[13] },
                 { body: 'link to site', correct: true, question: questions[14] },
                 { body: 'image path', question: questions[14] },
                 { body: 'break line', correct: true, question: questions[15] },
                 { body: 'new line', question: questions[15] }
               ])
Result.create!([
                 { user: users[0], test: tests[0], points: 5 },
                 { user: users[0], test: tests[2], points: 2 },
                 { user: users[0], test: tests[3], points: 1 },
                 { user: users[0], test: tests[4], points: 0 },
                 { user: users[1], test: tests[0], points: 6 },
                 { user: users[1], test: tests[6], points: 5 },
                 { user: users[1], test: tests[7], points: 4 },
                 { user: users[2], test: tests[0], points: 9 },
                 { user: users[2], test: tests[1], points: 7 },
                 { user: users[2], test: tests[2], points: 1 }
               ])
