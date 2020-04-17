create table fields (
  ntid integer not null,
  ord integer not null,
  name text not null collate unicase,
  config blob not null,
  primary key (ntid, ord)
) without rowid;
create unique index idx_fields_name_ntid on fields (name, ntid);
create table templates (
  ntid integer not null,
  ord integer not null,
  name text not null collate unicase,
  mtime_secs integer not null,
  usn integer not null,
  config blob not null,
  primary key (ntid, ord)
) without rowid;
create unique index idx_templates_name_ntid on templates (name, ntid);
create index idx_templates_usn on templates (usn);
create table notetypes (
  id integer not null primary key,
  name text not null collate unicase,
  mtime_secs integer not null,
  usn integer not null,
  config blob not null
);
create unique index idx_notetypes_name on notetypes (name);
create index idx_notetypes_usn on notetypes (usn);
update col
set
  ver = 15;
analyze;