(define-module (manifest)
  #:use-module (gnu packages)
  #:use-module (guix profiles)
  #:use-module (guix)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages maven)
  #:use-module ((gnu packages java) #:prefix java:)
  #:export (openjdk11 %evosuite-manifest))

(define openjdk11
  (package
    (inherit java:openjdk11)
    (native-search-paths
     (list (search-path-specification
            (variable "JAVA_HOME")
            (separator #f)
            (files (list "")))))))

(define %evosuite-manifest
  (packages->manifest
   (list glibc
         `(,openjdk11 "jdk")
         maven
         bash)))

%evosuite-manifest
