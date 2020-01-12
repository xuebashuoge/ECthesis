\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}
    [Zhejiang University Thesis and Design Template, Zixuan Wang zxwang42@gmail.com]

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=zjuthesis,
    prefix=
}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{AdvisorName}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{Department}
\DeclareStringOption{Title}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[undergraduate]{Degree}
\DeclareStringOption[general]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[proposal]{Period}
\DeclareStringOption[false]{BlindReview}
\DeclareStringOption[chinese]{Language}

\DeclareStringOption[doctor]{GradLevel}
\DeclareStringOption{ColaboratorName}
\DeclareStringOption{Topic}

\ProcessKeyvalOptions*

\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\LoadClass[
    zihao=-4,
    heading=true,
    UTF8,
    twoside
]{ctexrep}

\input{config/packages}

\ifthenelse{\equal{\Degree}{undergraduate}}
{
    % undergraduate
    \ifthenelse{\equal{\Type}{thesis}}
    {
        \newcommand{\TitleTypeName}{电子电路基础课程论文}
    }
    {
        \newcommand{\TitleTypeName}{电子电路基础课程论文}
    }
}


\input{config/path}
\input{config/commands}
\input{config/format/format}
\input{config/version}
