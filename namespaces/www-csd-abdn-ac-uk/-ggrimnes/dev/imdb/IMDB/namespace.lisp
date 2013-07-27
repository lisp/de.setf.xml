;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "acted"
                                          "art_department"
                                          "art_director"
                                          "assistant_director"
                                          "birth_date"
                                          "birth_name"
                                          "cast"
                                          "casting_director"
                                          "certificate"
                                          "cinematographer"
                                          "color_info"
                                          "company"
                                          "company"
                                          "company"
                                          "company"
                                          "composer"
                                          "costume_designer"
                                          "country"
                                          "crewmember"
                                          "crewmember"
                                          "death_date"
                                          "directed"
                                          "director"
                                          "distributor"
                                          "editor"
                                          "film"
                                          "genres"
                                          "languages"
                                          "longname"
                                          "make_up"
                                          "misc_companies"
                                          "Movie"
                                          "plot"
                                          "producer"
                                          "production_companies"
                                          "production_designer"
                                          "production_manager"
                                          "rating"
                                          "Role"
                                          "runtime"
                                          "set_decorator"
                                          "sound_crew"
                                          "sound_mix"
                                          "special_effects"
                                          "spouse"
                                          "stunt_performer"
                                          "teammember"
                                          "teammember"
                                          "teammember"
                                          "teammember"
                                          "teammember"
                                          "trivia"
                                          "votes"
                                          "writer"
                                          "year")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#")
           (make-package "http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("acted" "art_department" "art_director" "assistant_director"
             "birth_date" "birth_name" "cast" "casting_director" "certificate"
             "cinematographer" "color_info" "company" "company" "company"
             "company" "composer" "costume_designer" "country" "crewmember"
             "crewmember" "death_date" "directed" "director" "distributor"
             "editor" "film" "genres" "languages" "longname" "make_up"
             "misc_companies" "Movie" "plot" "producer" "production_companies"
             "production_designer" "production_manager" "rating" "Role"
             "runtime" "set_decorator" "sound_crew" "sound_mix"
             "special_effects" "spouse" "stunt_performer" "teammember"
             "teammember" "teammember" "teammember" "teammember" "trivia"
             "votes" "writer" "year"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#" :if-does-not-exist :load)
