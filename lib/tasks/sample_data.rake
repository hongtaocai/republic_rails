namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_publications
    make_relationships
    make_questions
    make_question_votes
    make_answers
    make_answer_votes
    make_reviews
    make_review_votes
  end
end

def make_users
  admin = User.create!(name:     'republic',
                       email:    "republic@republic.com",
                       password: "republic",
                       password_confirmation: "republic")

  99.times do |n|
    name  = "user-#{n+1}"
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_publications

  counter = 0

  file = File.new("lib/tasks/tiny_pub_data", "r")
  tmpdata = [];
  while (line = file.gets)

    if (counter %4 == 0 and tmpdata.length==4)
      title = tmpdata[0].strip!;
      author = tmpdata[1].strip!;
      abstract = tmpdata[2].strip!;
      google_url = tmpdata[3].strip!;

      Publication.create!(title: title, author: author, abstract: abstract, rating: 4, google_url: google_url,
                               journal: "science")


      tmpdata = [];
    end

    counter = counter + 1
    tmpdata.append(line);

  end

  if (counter %4 == 0 and tmpdata.length==4)
    title = tmpdata[0];
    author = tmpdata[1];
    abstract = tmpdata[2];
    google_url = tmpdata[3];

    Publication.create!(title: title, author: author, abstract: abstract, rating: 4, google_url: google_url,
                        journal: "science")

    tmpdata = [];
  end


  file.close


  # 50.times do
  #   content = Faker::Lorem.paragraph(10)
  #   title = Faker::Lorem.sentence(10)
  #   Publication.create!(title: title, author: Faker::Name.name, abstract: content, rating: 4, google_url: "www.google.com",
  #     journal: "science")
  # end
end

def make_relationships
  users = User.all
  ps = Publication.all

  users.each { |u|
    ps.each { |p|
      if rand(2)==0
        u.vote_pub!(p)
      end
    };
  }
end


def make_questions
  users = User.all
  pubs = Publication.all

  pubs.each { |p|
    users.each { |u|
      if rand(users.length) < 10
        Question.create!(title: Faker::Lorem.sentence(10).slice(0...-1)+"?",
                         content: Faker::Lorem.paragraph(10),
                         user_id: u.id,
                         publication_id: p.id)
      end
    }
  }
end

def make_question_votes
  qs = Question.all

  users = User.all

  qs.each { |q|
    users.each { |u|
      if rand(users.length) < 10
        u.vote_q!(q)
      end
    }
  }
end

def make_answers
  users = User.all

  qs = Question.all

  qs.each { |q|
    users.each { |u|
      if rand(users.length) < 3
        Answer.create!(content: Faker::Lorem.paragraph(15),
        user_id: u.id, question_id: q.id)
      end
    }
  }
end

def make_answer_votes
  as = Answer.all
  users = User.all
  as.each { |a|
    users.each { |u|
      if rand(users.length) < 6
        Avote.create!(user_id: u.id, answer_id: a.id)
      end
    }
  }
end

def make_one_review
  review_sample = "";
  10.times do
    review_sample = review_sample + '<p>' + Faker::Lorem.paragraph(10) + '</p>';
  end
  review_sample
end

def make_reviews
  users = User.all
  pubs = Publication.all

  pubs.each { |p|
    users.each { |u|
      if rand(users.length) < 4
        Review.create!(title: Faker::Lorem.sentence(10),
                         content:  Faker::Lorem.paragraph(35),
                         user_id: u.id,
                         publication_id: p.id)
      end
    }
  }
end

def make_review_votes
  rs = Review.all
  users = User.all
  rs.each { |r|
    users.each {|u|
      if rand(users.length) < 10
        Rvote.create!(user_id: u.id, review_id: r.id);
      end
    }
  }
end