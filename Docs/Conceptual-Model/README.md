# Model for Storing Neuropsychiatric Assessment Instruments in the OMOP CDM 

## Overview 

In clinical settings, a diverse range of neuropsychiatric assessment instruments is employed, including scores, scales, inventories, questionnaires, neuropsychological tests, clinical interviews, behavioral observations, neuroimaging, neuromodulation techniques, and genetic testing. Our initiative focuses on crafting a comprehensive conceptual model to effectively store and utilize these varied neuropsychiatric assessment tools within the OMOP Common Data Model (CDM). This approach aims to seamlessly integrate these complex data types, enhancing their utility in clinical and research environments for robust mental health data analysis.

# Problem Space 
----
The effective utilization of the OMOP CDM in neuropsychiatric settings involves a critical, strategic decision-making process centered on the optimal selection of domains and concept classes for mapping concepts. This selection is pivotal, especially when similar concepts span multiple domains within the OHDSI Athena vocabulary, and it profoundly impacts the utility and interpretability of the data.

### Challenges in Domain Selection

The choice of domain for mapping neuropsychiatric concepts is influenced heavily by the nature of the information being recorded and its intended application in healthcare analysis and research. Selecting the correct domain is crucial for ensuring that data is accurately represented and functional within its intended context. This requires a deep understanding of the domain's scope and the specific attributes of the assessment instruments.

### Variability in Concept Class Selection

A further layer of complexity is introduced by the lack of a standardized methodology for selecting Concept Classes across different vocabularies. Each vocabulary may employ its distinct logic and set of criteria for classifying concepts, which poses significant challenges in developing a universally applicable mapping strategy. This inconsistency highlights the necessity for rigorous analysis and specialized expertise in vocabulary management.

### Integration of Complex Data Types

Moreover, the integration of neuropsychiatric assessments into the OMOP CDM involves accommodating a wide array of data types, from quantitative scores and qualitative observations to image data and genetic markers. This diversity demands innovative solutions for data capture, storage, and interpretation, ensuring that each type of data can be fully leveraged for clinical and research purposes.

### Addressing Semantic Gaps and Coordination Approaches

Identifying and addressing semantic gaps where existing vocabularies do not adequately cover the spectrum of neuropsychiatric assessments is another critical area. This often requires the creation of new concepts or modification of existing ones, demanding ongoing collaboration between clinicians, researchers, and data architects. Additionally, the challenge of choosing between precoordination and postcoordination approaches in concept mapping affects how values are stored and accessed. Precoordination, which involves creating complex concepts beforehand, can simplify data retrieval but may limit flexibility. Postcoordination, where concepts are combined at the time of analysis, offers more adaptability but can complicate data integration and analysis processes.

By confronting these challenges head-on, we aim to enhance the reliability and consistency of data integration across diverse health data systems, thereby improving the quality of research outputs and the efficacy of clinical decision-making within the realm of neuropsychiatric.


## Domains 
----
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

