# Model for Storing Neuropsychiatric Assessment Instruments in the OMOP CDM 

## Overview 

In clinical settings, a diverse range of neuropsychiatric assessment instruments is employed, including scores, scales, inventories, questionnaires, neuropsychological tests, clinical interviews, behavioral observations, neuroimaging, neuromodulation techniques, and genetic testing. Our initiative focuses on crafting a comprehensive conceptual model to effectively store and utilize these varied neuropsychiatric assessment tools within the OMOP Common Data Model (CDM). This approach aims to seamlessly integrate these complex data types, enhancing their utility in clinical and research environments for robust mental health data analysis.

## Initial Objectives
* Establish a structured approach to organizing neuropsychiatric assessment data within the OMOP framework. 
* Distinguish between observations and measurements, advocating for clarity and consistency in classification.

# Problem Space 
----
The effective utilization of the OMOP CDM in neuropsychiatric settings involves a critical, strategic decision-making process centered on the optimal selection of domains and concept classes for mapping concepts. This selection is pivotal, especially when similar concepts span multiple domains within the OHDSI Athena vocabulary, and it profoundly impacts the utility and interpretability of the data.

### Challenges in Domain Selection
The choice of domain for mapping neuropsychiatric concepts is influenced heavily by the nature of the information being recorded and its intended application in healthcare analysis and research. Selecting the correct domain is crucial for ensuring that data is accurately represented and functional within its intended context. This requires a deep understanding of the domain's scope and the specific attributes of the assessment instruments.

### Measurement Classification
The conceptual model for integrating neuropsychiatric assessment tools (NPATs) within the OMOP framework should strongly advocate for classifying all assessment instruments primarily as measurements to ensure clarity, with well-justified exceptions. It should focus on establishing hierarchical relationships within the measurement domain, using multiple hierarchical structures to accommodate various facets such as observable behaviors, subjective experiences, and psychopathology dimensions. The model should integrate existing categorization schemes from sources like SNOMED and HPO, implementing a faceted classification system with top-level terms such as "psychopathology dimension" and "measurement category." Emphasizing the context and purpose of measurements, the model should allow for contextual variability and maintain robust documentation of metadata. Recognizing evolving standards, the model should remain flexible, supporting ongoing collaboration and refinement to adapt to new insights and standards in neuropsychiatric research and clinical practice.

### Variability in Concept Class Selection
A further layer of complexity is introduced by the lack of a standardized methodology for selecting Concept Classes across different vocabularies. Each vocabulary may employ its distinct logic and set of criteria for classifying concepts, which poses significant challenges in developing a universally applicable mapping strategy. This inconsistency highlights the necessity for rigorous analysis and specialized expertise in vocabulary management.

### Integration of Complex Data Types
Moreover, the integration of neuropsychiatric assessments into the OMOP CDM involves accommodating a wide array of data types, from quantitative scores and qualitative observations to image data and genetic markers. This diversity demands innovative solutions for data capture, storage, and interpretation, ensuring that each type of data can be fully leveraged for clinical and research purposes.

### Addressing Semantic Gaps and Coordination Approaches
Identifying and addressing semantic gaps where existing vocabularies do not adequately cover the spectrum of neuropsychiatric assessments is another critical area. This often requires the creation of new concepts or modification of existing ones, demanding ongoing collaboration between clinicians, researchers, and data architects. Additionally, the challenge of choosing between precoordination and postcoordination approaches in concept mapping affects how values are stored and accessed. Precoordination, which involves creating complex concepts beforehand, can simplify data retrieval but may limit flexibility. Postcoordination, where concepts are combined at the time of analysis, offers more adaptability but can complicate data integration and analysis processes.

### Categorization and Hierarchies
We need to focus on establishing clear and distinct hierarchical relationships within the measurement domain, separate from the broader OMOP vocabulary domains. This requires creating multiple hierarchical structures that accommodate various facets of measurements, such as observable behaviors, subjective experiences, and specific psychopathology dimensions. By addressing this, we can ensure that similar measurements are logically grouped together, thereby enhancing data organization and interoperability.

### Categorization Schemes
In the realm of categorization schemes, we face the challenge of differentiating between measurements of observable behaviors and those based on subjective experiences. Observable behaviors are externally visible actions and reactions, while subjective experiences pertain to an individual's internal perceptions and feelings. Additionally, there is a need to classify measurements according to dimensions of psychopathology, such as thought, affect, and other mental health phenomena. This dual-layered categorization is essential to accurately capture the complexity of neuropsychiatric assessments, ensuring that data is organized in a way that reflects both the observable and experiential facets of mental health, thereby enhancing the precision and utility of the OMOP framework.

### Compendiums and SNOMED/HPO
Integrating categorization schemes from existing compendiums, SNOMED, and HPO involves aligning diverse terminologies and classification systems, which is complex and requires careful mapping to enhance searchability and relevance. Ensuring consistency and accuracy while merging these schemes is crucial to avoid data misinterpretation.

### Facets and Classifications
Developing multiple facets for categorization, such as observable behaviors, subjective experiences, and specific psychopathology dimensions, presents significant challenges. It requires creating a flexible and comprehensive classification system that can accurately capture the complexity and diversity of neuropsychiatric assessments. Ensuring each facet is distinct yet integrative demands meticulous design to avoid overlap and maintain clarity. Define top-level terms for facets, such as "psychopathology dimension," "measurement category," and "source of information." Additionally, the system must be adaptable to various research and clinical needs, providing a nuanced understanding of mental health measurements. 

### Purpose-Driven Classification
Purpose-driven classification requires emphasizing the context and purpose of measurements to ensure classifications accurately reflect their function and typical use. This involves understanding various application contexts and creating a flexible framework that accommodates different uses, such as quick safety assessments versus detailed evaluations. Addressing these challenges will enhance the relevance and applicability of the OMOP framework for mental health assessments.

### Contextual Variability
The same measurement can serve different purposes across various settings, ranging from quick safety assessments to detailed psychopathological evaluations. This variability necessitates a flexible classification system that recognizes the diverse applications and ensures the measurement's context and purpose are accurately reflected, enhancing the relevance and utility of the OMOP framework for neuropsychiatric research and clinical practice.

### Evolving Standards 
The evolving nature of standards and terminologies, such as those from DSM and SNOMED, presents a challenge for maintaining a consistent and up-to-date classification system within the OMOP framework. Regular updates and revisions necessitate continuous adaptation to ensure relevance and accuracy. This dynamic environment requires robust mechanisms for integrating new standards and terminologies, complicating efforts to maintain stability and coherence in the data model, yet it is essential for the framework's effectiveness in neuropsychiatric research and clinical practice.

# General Principles of Data Organization for NPATs in OMOP
----
## Domains 
Within the OMOP CDM, neuropsychiatric assessment tools can be classified into four key domains: Measurement, Observation, Procedure, and Condition. Each domain serves a specific function and aligns with a corresponding event table in the OMOP CDM. Mastery of these classifications is vital for ensuring accurate and effective data integration:

| OMOP Vocabulary Domain | Term Example                                             | OMOP CDM Event Table     |
|------------------------|----------------------------------------------------------|--------------------------|
| Measurement            | Glasgow coma score eye opening                           | Measurement              |
| Observation            | Visual analog scale pain score                           | Observation              |
| Procedure              | Depression screening using PHQ-9 (Patient Health Questionnaire 9) score | Procedure_Occurrence     |
| Condition              | Glasgow coma scale, 10                                   | Condition_Occurrence     |

## Concept Classes
Different semantic Concept Classes are pivotal for representing various neuropsychiatric assessment tools within the OMOP Common Data Model (CDM). These classes provide structured groupings that enhance clarity and facilitate research. Below is a list of Concept Classes currently employed in the OMOP CDM for neuropsychiatric assessments:

| OMOP Concept Class    | Term Example | Details |
|-----------------------|--------------|---------|
| Survey                | Beck Depression Inventory Fast Screen total score [BDI] | `36303939 | 89208-3 | BDI | LOINC` |
| Staging/Scales        | Anxiety assessment scale | `40219470 | OMOP5000431 | Anxiety assessment scale | OMOP Extension` |
| Question Source       | Brief Resilient Coping Scale | `PPI | 1333269 | brcs | LOINC` |
| Procedure             | Assessment using Hamilton Rating Scale for Depression | `35621815 | 763071002 | Hamilton Depression Scale | SNOMED` |
| Precoordinated Pair   | EuroQol five dimension five level mobility score: 1 (I have no problems in walking about) | `742346 | OMOP5181556 | EuroQol | OMOP Extension` |
| Observable Entity     | Geriatric depression score | `4139531 | 425402008 | Geriatric depression score | SNOMED` |
| Context-dependent     | Assessment using Three Item Loneliness Scale declined | `37310437 | 1129711000000108 | Loneliness Scale declined | SNOMED` |
| Clinical Observation  | Anxiety score | `1001951 | 94024-7 | Anxiety score | LOINC` |
| Clinical Finding      | Finding of Frankl behavioral rating scale | `43531688 | 609369008 | Frankl Scale | SNOMED` |
| NAACCR Variable       | Functional Neurologic Status - Karnofsky Performance Scale (KPS) | `35917688 | cns_other@2900 | KPS | NAACCR` |
| HCPCS                 | Score on the memory functional communication measure at discharge was higher than at admission | `40660915 | G8609 | Memory Score | HCPCS` |
| CPT4                  | Brief emotional/behavioral assessment (eg, depression inventory, attention-deficit/hyperactivity disorder [ADHD] scale), with scoring and documentation, per standardized instrument | `46257498 | 96127 | ADHD scale | CPT4` |


# Data Conversion Best Practices
----
In the process of integrating neuropsychiatric scales into the OMOP CDM, adopting best practices for data conversion is paramount. This section outlines key strategies that are essential for ensuring high-quality data mapping and standardization within the model. (TBD)

## Comprehensive Ontology for Neuropsychiatric Scales

Creating a comprehensive ontology for neuropsychiatric scales is crucial. A thorough ontology ensures that each scale is accurately represented in the CDM, capturing all relevant clinical nuances and details (TBD)

## Deduplication Across Different Domains

Deduplication is another critical aspect of data conversion. It involves identifying and resolving duplicate entries across different domains within the CDM.(TBD)

## Leveraging Measurement and Observable Entities

Utilizing the domains of Measurement and Observable Entities, particularly those from SNOMED, is advised for representing detailed neuropsychiatric data. These domains allow for the nuanced categorization of clinical findings and observations, providing a rich substrate for data analysis. By effectively leveraging these entities, the CDM can accommodate a wide array of neuropsychiatric measurements and observations, enhancing the granularity and utility of the data.(TBD)

