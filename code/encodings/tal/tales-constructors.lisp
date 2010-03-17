;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: tal; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  constructor methods use within the tales parser.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20020212' AUTHOR='JAA'/>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "TAL")


(defTokenConstructors
  "local" "global" "text" "structure" "python" "lisp"
  "path" "not" "str" "string" "var")

(defConstructor |AttributesArgument| (attribute-argument attribute-statement)
  (cons attribute-statement attribute-argument))

(defConstructor |AttributeStatement| (expression qname)
  (list :qname qname :expression expression))

(defIdentityconstructor |ConditionArgument| )

(defConstructor |ContentArgument| (expression structure text)
  (declare (ignore text))
  (unless (stringp expression)
    (setf expression `(value-string ,expression)))
  (cond (structure
         `(encode-string ,expression))
        (t
         `(encode-node ,expression))))

(defConstructor |DefineArgument| (define-argument define-scope)
  (cons define-scope define-argument))

(defConstructor |DefineScope| (define-var global local)
  (declare (ignore local))
  (destructuring-bind (&key ncname expression) define-var
    (setf ncname (intern (string-upcase ncname)))
    (cond (global
           `(setq ,ncname ,expression))
          (t
           `(let ,ncname ,expression)))))

(defConstructor |DefineVar-Constructor| (expression ncname)
  (setf ncname (intern (string-upcase ncname)))
  (list :ncname ncname :expression expression))

(defConstructor |Expression| (lisp-expression not-expression path-expression
                                              python-expression string-expression
                                              variable-expression)
  (or lisp-expression not-expression path-expression python-expression
      string-expression variable-expression))

(defConstructor |LispExpression| (lisp string-data)
  (declare (ignore lisp))
  (parse-lisp-expression string-data))

(defConstructor |NCName-Constructor| (ncname)
  ;; defer intern
  ncname)

(defConstructor |NotExpression| (expression not)
  (declare (ignore not))
  `(not ,expression))

(defIdentityconstructor |OmitTagArgument| )

(defConstructor |OnErrorArgument| (expression structure text)
  (declare (ignore text))
  (unless (stringp expression)
    (setf expression `(value-string ,expression)))
  (cond (structure
         `(encode-string ,expression))
        (t
         `(encode-node ,expression))))

(defConstructor |PathOperation| (NCName URLSegment*)
  (setf ncname (intern (string-upcase ncname)))
  `(path ,NCName ,(reverse URLSegment*)))

(defConstructor |PathExpression-Constructor| (path path-operation*)
  (case (length path-operation*)
    (0 nil)
    (1 (first path-operation*))
    (t `(or ,path ,@(reverse path-operation*)))))

(defConstructor |PlainString| (element*)
  (case (length element*)
    (0 "")
    (1 (first element*))
    (t
     (apply #'concatenate 'string (reverse element*)))))

(defIdentityConstructor |PlainStringElement| )

(defIdentityConstructor |Prefix| )

(defConstructor |PythonExpression| (python string-data)
  (declare (ignore python))
  (parse-python-expression string-data))

(defConstructor |QName-Constructor| (ncname prefix)
  (make-uname "" :prefix (or prefix "") :local-part ncname))

(defConstructor |RepeatArgument| (expression ncname)
  (setf ncname (intern (string-upcase ncname)))
  (list :ncname ncname :expression expression))

(defConstructor |ReplaceArgument| (expression structure text)
  (declare (ignore text))
  (unless (stringp expression)
    (setf expression `(value-string ,expression)))
  (cond (structure
         `(encode-string ,expression))
        (t
         `(encode-node ,expression))))

(defIdentityConstructor |StringData| )

(defConstructor |StringExpression| (str string string-element*)
  (declare (ignore str string))
  (case (length string-element*)
    (0 "")
    (1 (first string-element*))
    (t `(list ,@(reverse string-element*)))))

(defConstructor |StringExpressionElement-Constructor| (plain-string varsub)
  (or plain-string varsub))

(defConstructor |Tales-Constructor| (defineArgument AttributesArgument ConditionArgument 
                                      ReplaceArgument ContentArgument RepeatArgument OnErrorArgument
                                      OmitTagArgument)
  (or DefineArgument AttributesArgument ConditionArgument 
                                      ReplaceArgument ContentArgument RepeatArgument OnErrorArgument
                                      OmitTagArgument))

(defIdentityConstructor |URLSegment| )

(defConstructor |Varsub-Constructor| (ncname)
  (setf ncname (intern (string-upcase ncname)))
  ncname)

(defConstructor |VariableExpression-Constructor| (ncname var)
  (declare (ignore var))
  (setf ncname (intern (string-upcase ncname)))
  ncname)

:EOF
