-- Job Categories Table
CREATE TABLE JobCategories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sort_order INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted BOOLEAN
);

-- Job Types Table
CREATE TABLE JobTypes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    job_category_id INT,
    sort_order INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted BOOLEAN,
    FOREIGN KEY (job_category_id) REFERENCES JobCategories(id)
);

-- Jobs Table
CREATE TABLE Jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    media_id INT,
    job_category_id INT,
    job_type_id INT,
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location TEXT,
    activity TEXT,
    academic_degree_doctor BOOLEAN,
    academic_degree_master BOOLEAN,
    academic_degree_professional BOOLEAN,
    academic_degree_bachelor BOOLEAN,
    salary_statistic_group TEXT,
    salary_range_first_year DECIMAL(10, 2),
    salary_range_average DECIMAL(10, 2),
    salary_range_remarks TEXT,
    restriction TEXT,
    estimated_total_workers INT,
    remarks TEXT,
    url VARCHAR(255),
    seo_description TEXT,
    seo_keywords TEXT,
    sort_order INT,
    publish_status BOOLEAN,
    version INT,
    created_by INT,
    created DATETIME,
    modified DATETIME,
    deleted BOOLEAN,
    FOREIGN KEY (job_category_id) REFERENCES JobCategories(id),
    FOREIGN KEY (job_type_id) REFERENCES JobTypes(id)
);

-- Personalities Table
CREATE TABLE Personalities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);

-- Jobs Personalities Table
CREATE TABLE JobsPersonalities (
    job_id INT,
    personality_id INT,
    PRIMARY KEY (job_id, personality_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (personality_id) REFERENCES Personalities(id)
);

-- Practical Skills Table
CREATE TABLE PracticalSkills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);


-- Jobs Practical Skills Table
CREATE TABLE JobsPracticalSkills (
    job_id INT,
    practical_skill_id INT,
    PRIMARY KEY (job_id, practical_skill_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (practical_skill_id) REFERENCES PracticalSkills(id)
);

-- Basic Abilities Table
CREATE TABLE BasicAbilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);


-- Jobs Basic Abilities Table
CREATE TABLE JobsBasicAbilities (
    job_id INT,
    basic_ability_id INT,
    PRIMARY KEY (job_id, basic_ability_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (basic_ability_id) REFERENCES BasicAbilities(id)
);

-- Tools Table
CREATE TABLE Tools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type INT,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);

-- Jobs Tools Table
CREATE TABLE JobsTools (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (affiliate_id) REFERENCES Tools(id)
);


-- Career Paths Table
CREATE TABLE CareerPaths (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type INT,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);

-- Jobs Career Paths Table
CREATE TABLE JobsCareerPaths (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (affiliate_id) REFERENCES CareerPaths(id)
);


-- Rec Qualifications Table
CREATE TABLE RecQualifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type INT,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);


-- Jobs Rec Qualifications Table
CREATE TABLE JobsRecQualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (affiliate_id) REFERENCES RecQualifications(id)
);


-- Req Qualifications Table
CREATE TABLE ReqQualifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type INT,
    name VARCHAR(255) NOT NULL,
    deleted BOOLEAN
);

-- Jobs Req Qualifications Table
CREATE TABLE JobsReqQualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(id),
    FOREIGN KEY (affiliate_id) REFERENCES ReqQualifications(id)
);

-- Affiliate Table
CREATE TABLE affiliates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type INT,
    name VARCHAR(255),
    deleted BOOLEAN DEFAULT FALSE
);



-- creating an indexes
CREATE INDEX idx_job_categories_id ON job_categories(id);
CREATE INDEX idx_jobs_job_category_id ON jobs(job_category_id);
CREATE INDEX idx_jobs_job_type_id ON jobs(job_type_id);
CREATE INDEX idx_jobs_deleted ON jobs(deleted);
CREATE INDEX idx_jobs_publish_status ON jobs(publish_status);
CREATE INDEX idx_jobs_sort_order ON jobs(sort_order);


explain SELECT 
    Jobs.id AS `Jobs__id`,
    Jobs.name AS `Jobs__name`,
    Jobs.media_id AS `Jobs__media_id`,
    Jobs.job_category_id AS `Jobs__job_category_id`,
    Jobs.job_type_id AS `Jobs__job_type_id`,
    Jobs.description AS `Jobs__description`,
    Jobs.detail AS `Jobs__detail`,
    Jobs.business_skill AS `Jobs__business_skill`,
    Jobs.knowledge AS `Jobs__knowledge`,
    Jobs.location AS `Jobs__location`,
    Jobs.activity AS `Jobs__activity`,
    Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
    Jobs.academic_degree_master AS `Jobs__academic_degree_master`,
    Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
    Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
    Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
    Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
    Jobs.salary_range_average AS `Jobs__salary_range_average`,
    Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
    Jobs.restriction AS `Jobs__restriction`,
    Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
    Jobs.remarks AS `Jobs__remarks`,
    Jobs.url AS `Jobs__url`,
    Jobs.seo_description AS `Jobs__seo_description`,
    Jobs.seo_keywords AS `Jobs__seo_keywords`,
    Jobs.sort_order AS `Jobs__sort_order`,
    Jobs.publish_status AS `Jobs__publish_status`,
    Jobs.version AS `Jobs__version`,
    Jobs.created_by AS `Jobs__created_by`,
    Jobs.created AS `Jobs__created`,
    Jobs.modified AS `Jobs__modified`,
    Jobs.deleted AS `Jobs__deleted`,
    JobCategories.id AS `JobCategories__id`,
    JobCategories.name AS `JobCategories__name`,
    JobCategories.sort_order AS `JobCategories__sort_order`,
    JobCategories.created_by AS `JobCategories__created_by`,
    JobCategories.created AS `JobCategories__created`,
    JobCategories.modified AS `JobCategories__modified`,
    JobCategories.deleted AS `JobCategories__deleted`,
    JobTypes.id AS `JobTypes__id`,
    JobTypes.name AS `JobTypes__name`,
    JobTypes.job_category_id AS `JobTypes__job_category_id`,
    JobTypes.sort_order AS `JobTypes__sort_order`,
    JobTypes.created_by AS `JobTypes__created_by`,
    JobTypes.created AS `JobTypes__created`,
    JobTypes.modified AS `JobTypes__modified`,
    JobTypes.deleted AS `JobTypes__deleted`,
    Tools.name AS `Tools__name`,
    CareerPaths.name AS `CareerPaths__name`,
    RecQualifications.name AS `RecQualifications__name`,
    ReqQualifications.name AS `ReqQualifications__name`
FROM jobs Jobs
INNER JOIN job_categories JobCategories
    ON JobCategories.id = Jobs.job_category_id
    AND JobCategories.deleted IS NULL
INNER JOIN job_types JobTypes
    ON JobTypes.id = Jobs.job_type_id
    AND JobTypes.deleted IS NULL
LEFT JOIN jobs_personalities JobsPersonalities
    ON Jobs.id = JobsPersonalities.job_id
LEFT JOIN personalities Personalities
    ON Personalities.id = JobsPersonalities.personality_id
    AND Personalities.deleted IS NULL
LEFT JOIN jobs_practical_skills JobsPracticalSkills
    ON Jobs.id = JobsPracticalSkills.job_id
LEFT JOIN practical_skills PracticalSkills
    ON PracticalSkills.id = JobsPracticalSkills.practical_skill_id
    AND PracticalSkills.deleted IS NULL
LEFT JOIN jobs_basic_abilities JobsBasicAbilities
    ON Jobs.id = JobsBasicAbilities.job_id
LEFT JOIN basic_abilities BasicAbilities
    ON BasicAbilities.id = JobsBasicAbilities.basic_ability_id
    AND BasicAbilities.deleted IS NULL
LEFT JOIN jobs_tools JobsTools
    ON Jobs.id = JobsTools.job_id
LEFT JOIN affiliates Tools
    ON Tools.type = 1
    AND Tools.id = JobsTools.affiliate_id
    AND Tools.deleted IS NULL
LEFT JOIN jobs_career_paths JobsCareerPaths
    ON Jobs.id = JobsCareerPaths.job_id
LEFT JOIN affiliates CareerPaths
    ON CareerPaths.type = 3
    AND CareerPaths.id = JobsCareerPaths.affiliate_id
    AND CareerPaths.deleted IS NULL
LEFT JOIN jobs_rec_qualifications JobsRecQualifications
    ON Jobs.id = JobsRecQualifications.job_id
LEFT JOIN affiliates RecQualifications
    ON RecQualifications.type = 2
    AND RecQualifications.id = JobsRecQualifications.affiliate_id
    AND RecQualifications.deleted IS NULL
LEFT JOIN jobs_req_qualifications JobsReqQualifications
    ON Jobs.id = JobsReqQualifications.job_id
LEFT JOIN affiliates ReqQualifications
    ON ReqQualifications.type = 2
    AND ReqQualifications.id = JobsReqQualifications.affiliate_id
    AND ReqQualifications.deleted IS NULL
WHERE (
    JobCategories.name LIKE '%キャビンアテンダント%'
    OR JobTypes.name LIKE '%キャビンアテンダント%'
    OR Jobs.name LIKE '%キャビンアテンダント%'
    OR Jobs.description LIKE '%キャビンアテンダント%'
    OR Jobs.detail LIKE '%キャビンアテンダント%'
    OR Jobs.business_skill LIKE '%キャビンアテンダント%'
    OR Jobs.knowledge LIKE '%キャビンアテンダント%'
    OR Jobs.location LIKE '%キャビンアテンダント%'
    OR Jobs.activity LIKE '%キャビンアテンダント%'
    OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%'
    OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%'
    OR Jobs.restriction LIKE '%キャビンアテンダント%'
    OR Jobs.remarks LIKE '%キャビンアテンダント%'
    OR Personalities.name LIKE '%キャビンアテンダント%'
    OR PracticalSkills.name LIKE '%キャビンアテンダント%'
    OR BasicAbilities.name LIKE '%キャビンアテンダント%'
    OR Tools.name LIKE '%キャビンアテンダント%'
    OR CareerPaths.name LIKE '%キャビンアテンダント%'
    OR RecQualifications.name LIKE '%キャビンアテンダント%'
    OR ReqQualifications.name LIKE '%キャビンアテンダント%'
)
AND Jobs.publish_status = 1
AND Jobs.deleted IS NULL
ORDER BY Jobs.sort_order DESC, Jobs.id DESC
LIMIT 50 OFFSET 0;




