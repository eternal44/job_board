# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic versioning]((http://semver.org/).

Check out [keepachangelog.com](http://keepachangelog.com/) for a
style guide.

## [Unreleased]
###  Added
- authorization scopes for each user-type.
- invoicing options for each job request
- worker dashboard interface

## [0.0.1] - 2015-11-01
### Changed
- convert unique user models (employer, worker, admin) into one and add
  a 'role' column instead.

### Added
- 4 roles: worker, employer, attendant, admin
- Admin dashboard
- Job packet - essentially a jobs#show with all of the relevant job
  information an attendant needs to give a worker for a job.


